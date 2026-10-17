# Exercise 07: Cloud Onboarding for ML Infrastructure Engineers

**Duration:** 3 hours
**Difficulty:** Beginner+
**Prerequisites:** Exercises 01-06 complete; AWS/GCP/Azure account ready

## Objective

Build a CLI tool (`cloud-onboard`) that bootstraps a new ML engineer's cloud environment in under 5 minutes. The tool provisions an isolated sandbox VPC/network, configures least-privilege IAM, sets up an artifact bucket, and emits a `.env` file the engineer can drop into their dev environment.

By the end you'll have a runnable, tested CLI that demonstrates the recurring pattern: **codify your team's onboarding so engineer #20 isn't slower than engineer #2**.

## Why this matters

Every ML platform team spends ~1 day onboarding each new engineer to the cloud. Multiply by team size and turnover and that's a real cost. Engineers also accumulate stale credentials, over-broad IAM, and ad-hoc buckets that become security and cost liabilities. A scripted onboarding fixes both problems and is the simplest, highest-ROI ML infra tool you can build.

## Requirements

Build `cloud-onboard` as a Python CLI (use `typer` or `click`) with these commands:

```text
cloud-onboard init       --user alice --provider aws --region us-west-2
cloud-onboard status     --user alice
cloud-onboard rotate-key --user alice
cloud-onboard destroy    --user alice
```

### `init` must

1. Validate that the calling identity has admin permissions on the target provider.
2. Provision a per-user **sandbox VPC** (or analogue):
   - AWS: a /24 VPC with one public + one private subnet
   - GCP: a VPC + one subnet
   - Azure: a Resource Group + VNet + subnet
3. Create a **per-user S3/GCS/Blob bucket** for artifacts, tagged with `Owner=<user>`.
4. Create a **per-user IAM principal** scoped to:
   - Full access to that user's bucket
   - Read access to a shared `team-data` bucket (assume it pre-exists)
   - No other permissions
5. Generate access credentials and write them to `~/.config/ml-onboard/<user>.env` as:
   ```
   AWS_ACCESS_KEY_ID=...
   AWS_SECRET_ACCESS_KEY=...
   AWS_REGION=us-west-2
   ML_ARTIFACT_BUCKET=s3://ml-sandbox-alice-2026
   ```
6. Print a copy-paste setup snippet for the user's shell.

### `status` must

Show what's currently provisioned for that user (bucket name, IAM principal ARN, key age in days).

### `rotate-key` must

Generate a new credential, invalidate the old one, update the `.env`.

### `destroy` must

Remove everything `init` created. Idempotent (safe to re-run).

## Code skeleton

Start with this layout:

```
cloud-onboard/
├── pyproject.toml
├── src/cloud_onboard/
│   ├── __init__.py
│   ├── cli.py             # typer commands
│   ├── providers/
│   │   ├── __init__.py
│   │   ├── base.py        # abstract Provider class
│   │   ├── aws.py
│   │   ├── gcp.py
│   │   └── azure.py
│   ├── state.py           # writes ~/.config/ml-onboard/<user>.json
│   └── env.py             # writes the .env file
└── tests/
    └── test_aws_init.py   # use moto to mock AWS
```

### Suggested `providers/base.py`

```python
from abc import ABC, abstractmethod
from dataclasses import dataclass

@dataclass(frozen=True)
class Provisioned:
    bucket: str
    iam_principal: str
    creds: dict[str, str]

class Provider(ABC):
    @abstractmethod
    def init(self, user: str, region: str) -> Provisioned: ...
    @abstractmethod
    def status(self, user: str) -> dict: ...
    @abstractmethod
    def rotate_key(self, user: str) -> dict[str, str]: ...
    @abstractmethod
    def destroy(self, user: str) -> None: ...
```

## Deliverables

1. Working CLI you can demo end-to-end on at least one provider.
2. **Tests** using `moto` (or provider-equivalent) so CI doesn't need real cloud creds.
3. A short `README.md` in the project root with install + quickstart.
4. A `CHANGELOG.md` describing this version.

## Step-by-step

### Step 1 — Skeleton (20 min)
Set up the project per the layout above. Wire `typer` for the CLI. Make `cloud-onboard --help` work.

### Step 2 — State file (15 min)
Implement `state.py`: read/write `~/.config/ml-onboard/<user>.json` tracking which resources have been created. Idempotency depends on this.

### Step 3 — AWS provider (60 min)
Implement `providers/aws.py` using `boto3`. The recommended order is:
1. Create VPC + subnets (use the `aws_vpc` Terraform module structure for reference)
2. Create S3 bucket with versioning + encryption + tags
3. Create IAM user, attach inline policy scoped to the bucket, create access key
4. Persist all created ARNs to the state file

### Step 4 — env writer (15 min)
Implement `env.py`: write the `.env` with 0600 permissions; never log the secret to stdout.

### Step 5 — Testing with moto (30 min)
```python
import moto, pytest
from cloud_onboard.providers.aws import AWSProvider

@pytest.fixture
def aws_mock():
    with moto.mock_aws():
        yield

def test_init_creates_bucket_and_iam(aws_mock):
    p = AWSProvider()
    out = p.init(user="alice", region="us-west-2")
    assert out.bucket.startswith("ml-sandbox-alice")
    assert "alice" in out.iam_principal
```

### Step 6 — destroy idempotency (20 min)
Implement `destroy` so it can run twice in a row without errors when resources are partially gone.

### Step 7 — Rotation + status (20 min)
Cap key age at 90 days; `status` warns when a key is past 80 days. Test it.

### Step 8 — Polish (20 min)
- `--dry-run` flag that prints what would happen but doesn't call any cloud API
- Friendly error messages when credentials are missing
- Verbose mode (`-v`) that logs every API call

## Validation

A passing exercise satisfies all of:

- [ ] `cloud-onboard init --user testuser --provider aws --region us-west-2` completes without errors.
- [ ] After init, `aws s3 ls` shows the user's bucket.
- [ ] After init, the IAM principal exists and has only the scoped policy.
- [ ] `cat ~/.config/ml-onboard/testuser.env` shows valid credentials (file mode 0600).
- [ ] `cloud-onboard status --user testuser` returns valid JSON.
- [ ] `cloud-onboard rotate-key --user testuser` issues a new key and invalidates the old one.
- [ ] `cloud-onboard destroy --user testuser` removes all created resources. Running it twice succeeds.
- [ ] `pytest` passes (moto-based unit tests).

## Stretch goals

- Add `cloud-onboard audit` that scans for un-managed buckets/keys owned by team members.
- Implement the GCP provider; verify CLI works identically against either.
- Add an OPA/Conftest policy that fails CI if the IAM policy grants anything outside the scoped bucket.
- Add a `--ttl 7d` option that schedules automatic destroy after a TTL.

## Common pitfalls

- **IAM eventual consistency** — Newly created principals can take 5-10s to be usable. Add a brief retry.
- **Hardcoded region** — Read region from env or CLI; never hardcode.
- **Logging secrets** — Set `logging.getLogger("botocore").setLevel(logging.WARNING)`. Default boto3 logging will print credentials.
- **Idempotency via state file alone** — Always also try-create and handle `AlreadyExists`; state file can lie if the cloud was modified externally.

## Solutions

A reference implementation lives at [`ai-infra-engineer-solutions/modules/mod-101-foundations/exercise-07-cloud-onboarding/`](https://github.com/ai-infra-curriculum/ai-infra-engineer-solutions/tree/main/modules/mod-101-foundations/exercise-07-cloud-onboarding). **Do this exercise yourself first** — the muscle memory of writing the IAM policy correctly is the actual lesson.
