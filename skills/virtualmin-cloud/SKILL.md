---
name: virtualmin-cloud
description: Manage Amazon S3 and Rackspace Cloud Files storage for Virtualmin backups and files
license: MIT
metadata:
  author: tranmani
  email: minhhuy8137@gmail.com
  version: 1.0.0
  docs: https://www.virtualmin.com/docs/development/api-programs/list-s3-buckets/
---

# Virtualmin Cloud Storage

Manage Amazon S3 buckets and Rackspace Cloud Files containers for use with Virtualmin backups.

## When to Use

- Create or delete S3 buckets for backup storage
- Upload or download files to/from S3 or Rackspace
- List files in cloud storage containers
- Configure cloud storage as a backup destination

## Available Scripts

### Amazon S3

| Script | Command | Description |
|--------|---------|-------------|
| `create-s3-bucket.sh` | `virtualmin create-s3-bucket` | Create a new S3 bucket |
| `delete-s3-bucket.sh` | `virtualmin delete-s3-bucket` | Delete an S3 bucket |
| `list-s3-buckets.sh` | `virtualmin list-s3-buckets` | List all S3 buckets |
| `list-s3-files.sh` | `virtualmin list-s3-files` | List files in an S3 bucket |
| `upload-s3-file.sh` | `virtualmin upload-s3-file` | Upload a file to S3 |
| `download-s3-file.sh` | `virtualmin download-s3-file` | Download a file from S3 |
| `delete-s3-file.sh` | `virtualmin delete-s3-file` | Delete a file from S3 |

### Rackspace Cloud Files

| Script | Command | Description |
|--------|---------|-------------|
| `create-rs-container.sh` | `virtualmin create-rs-container` | Create a Rackspace container |
| `delete-rs-container.sh` | `virtualmin delete-rs-container` | Delete a Rackspace container |
| `list-rs-containers.sh` | `virtualmin list-rs-containers` | List all Rackspace containers |
| `list-rs-files.sh` | `virtualmin list-rs-files` | List files in a container |
| `upload-rs-file.sh` | `virtualmin upload-rs-file` | Upload a file to Rackspace |
| `download-rs-file.sh` | `virtualmin download-rs-file` | Download a file from Rackspace |
| `delete-rs-file.sh` | `virtualmin delete-rs-file` | Delete a file from Rackspace |

## Usage

```bash
sudo bash list-s3-buckets.sh --account myaccount
sudo bash create-s3-bucket.sh --account myaccount --bucket virtualmin-backups
sudo bash upload-s3-file.sh --account myaccount --bucket virtualmin-backups --file /mnt/data/backups/example.com.tar.gz
```

## Notes

- S3 credentials (access key, secret key) must be configured in Virtualmin under Cloudmin Services
- Use S3 or Rackspace as backup destination with `virtualmin backup-domain --dest s3://...`
- Rackspace requires API key authentication configured in Virtualmin
