# แล็บ 03: รัน Spark Batch Job บนเครื่อง

**ระยะเวลา:** 60 นาที  **ความรู้พื้นฐานที่ต้องมี:** Java 11+, Python 3.11+

## วัตถุประสงค์
รัน PySpark บนเครื่อง ประมวลผล dataset ที่มีความหมาย (ตัวอย่างข้อมูลการเดินทางของแท็กซี่ NYC) และเขียนผลลัพธ์เป็น Parquet ที่แบ่ง partition ตามวันที่

## ขั้นตอน

### 1. ติดตั้ง PySpark
```bash
python -m venv venv && source venv/bin/activate
pip install 'pyspark==3.5.1' pyarrow
```

### 2. ดาวน์โหลดข้อมูลตัวอย่าง
```bash
mkdir -p data
curl -LfO https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2024-01.parquet
mv yellow_tripdata_2024-01.parquet data/
```

### 3. เขียน Spark job
```python
# job.py
from pyspark.sql import SparkSession, functions as F

spark = (
    SparkSession.builder
    .appName("taxi-trip-aggregation")
    .config("spark.sql.shuffle.partitions", "8")
    .getOrCreate()
)

df = spark.read.parquet("data/yellow_tripdata_2024-01.parquet")
print(f"rows: {df.count():,}")

agg = (
    df
    .withColumn("date", F.to_date("tpep_pickup_datetime"))
    .filter(F.col("date").between("2024-01-01", "2024-01-31"))
    .groupBy("date", "PULocationID")
    .agg(
        F.count("*").alias("trips"),
        F.avg("fare_amount").alias("avg_fare"),
        F.avg("trip_distance").alias("avg_distance"),
    )
)

(
    agg
    .repartition("date")
    .write.mode("overwrite")
    .partitionBy("date")
    .parquet("data/trips_by_pickup")
)

print("done")
spark.stop()
```

### 4. รัน job
```bash
python job.py
ls data/trips_by_pickup/
```

### 5. อ่านกลับมาเพื่อยืนยัน
```python
import pyspark
spark = pyspark.sql.SparkSession.builder.getOrCreate()
out = spark.read.parquet("data/trips_by_pickup")
out.show(10)
out.filter("date = '2024-01-15'").orderBy(F.desc("trips")).show(5)
```

### 6. ปรับจูนให้เหมาะกับแล็ปท็อปของคุณ
```python
.config("spark.driver.memory", "4g")
.config("spark.sql.shuffle.partitions", "4")    # default 200, way too many for laptop
```

## การตรวจสอบ
- [ ] Job ทำงานเสร็จภายในเวลาน้อยกว่า 2 นาที
- [ ] ไดเรกทอรีผลลัพธ์มี `date=2024-01-01/`, `date=2024-01-02/` เป็นต้น
- [ ] การอ่านซ้ำได้แถวที่ aggregate แล้วตามที่คาดไว้

## การล้างทรัพยากร
```bash
rm -rf data/
```

## การแก้ไขปัญหา
- **`Java HotSpot Memory error`** — ลดค่า `spark.driver.memory` หรือประมวลผลจำนวนวันให้น้อยลง
- **`Permission denied: jps`** — Java ไม่อยู่ใน PATH; `brew install openjdk@17 && export JAVA_HOME=...`
- **ไฟล์ผลลัพธ์มากเกินไป** — ใช้ `repartition("date")` ก่อน `partitionBy` เพื่อให้เหลือหนึ่งไฟล์ต่อ partition ของวันที่
