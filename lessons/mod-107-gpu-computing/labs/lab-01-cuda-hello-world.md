# Lab 01: CUDA Hello-World และการตรวจสอบข้อมูลอุปกรณ์

**ระยะเวลา:** 45 นาที  **สิ่งที่ต้องมีก่อน:** NVIDIA GPU + ติดตั้ง CUDA Toolkit แล้ว

## วัตถุประสงค์
ตรวจสอบว่า CUDA toolchain ทำงานได้ปกติ เขียนและคอมไพล์ kernel ขนาดเล็ก และ query คุณสมบัติของอุปกรณ์ผ่านโปรแกรม

## ขั้นตอน

### 1. ตรวจสอบ toolchain
```bash
nvidia-smi                 # GPU detected
nvcc --version             # CUDA compiler installed
```

### 2. Kernel ขนาดเล็ก: บวกเวกเตอร์
```cuda
// vector_add.cu
#include <cstdio>

__global__ void add(int n, const float *x, const float *y, float *out) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) out[i] = x[i] + y[i];
}

int main() {
    const int N = 1 << 20;
    size_t bytes = N * sizeof(float);
    float *x_h = (float*)malloc(bytes), *y_h = (float*)malloc(bytes), *o_h = (float*)malloc(bytes);
    for (int i = 0; i < N; i++) { x_h[i] = 1.0f; y_h[i] = 2.0f; }

    float *x, *y, *o;
    cudaMalloc(&x, bytes); cudaMalloc(&y, bytes); cudaMalloc(&o, bytes);
    cudaMemcpy(x, x_h, bytes, cudaMemcpyHostToDevice);
    cudaMemcpy(y, y_h, bytes, cudaMemcpyHostToDevice);

    int block = 256, grid = (N + block - 1) / block;
    add<<<grid, block>>>(N, x, y, o);
    cudaDeviceSynchronize();

    cudaMemcpy(o_h, o, bytes, cudaMemcpyDeviceToHost);
    printf("o[0]=%f o[N-1]=%f\n", o_h[0], o_h[N-1]);

    cudaFree(x); cudaFree(y); cudaFree(o);
    free(x_h); free(y_h); free(o_h);
    return 0;
}
```
```bash
nvcc -O2 -o vector_add vector_add.cu
./vector_add
# Expected: o[0]=3.000000 o[N-1]=3.000000
```

### 3. ตรวจสอบข้อมูลอุปกรณ์
```cuda
// device_info.cu
#include <cstdio>
int main() {
    int n; cudaGetDeviceCount(&n);
    for (int i = 0; i < n; ++i) {
        cudaDeviceProp p; cudaGetDeviceProperties(&p, i);
        printf("device %d: %s\n", i, p.name);
        printf("  compute cap: %d.%d\n", p.major, p.minor);
        printf("  global mem:  %.2f GB\n", p.totalGlobalMem / 1e9);
        printf("  SMs:         %d\n", p.multiProcessorCount);
        printf("  max threads/block: %d\n", p.maxThreadsPerBlock);
    }
}
```
```bash
nvcc -o device_info device_info.cu && ./device_info
```

### 4. Profile ด้วย nsys
```bash
nsys profile --stats=true ./vector_add
```
สังเกตเวลาของ kernel เทียบกับเวลาของ memcpy

## การตรวจสอบผล
- [ ] `nvidia-smi` แสดง GPU ของคุณ
- [ ] `vector_add` พิมพ์ค่า `3.0` ทั้งสมาชิกตัวแรกและตัวสุดท้าย
- [ ] `device_info` แสดงอุปกรณ์อย่างน้อยหนึ่งตัว
- [ ] สถิติของ `nsys` แสดงการเรียก CUDA API ที่มีนัยสำคัญ

## การล้างทรัพยากร
```bash
rm vector_add device_info *.cu
```

## การแก้ปัญหา
- **`nvcc: command not found`** — ติดตั้ง CUDA Toolkit และเพิ่ม `/usr/local/cuda/bin` ลงใน PATH
- **`no CUDA-capable device is detected`** — Driver ยังไม่ถูกโหลด ใช้ `sudo modprobe nvidia` บน Linux
- **Kernel คืนค่าผิด** — ตรวจสอบการคำนวณขนาด grid/block สำหรับ N=1M และ block=256 ค่า grid ต้องเป็น 4096
