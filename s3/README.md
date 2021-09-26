# AWS Vpc End Points

Terraform module which creates a s3 bucket with provided `acl` and `name`.

## Requirements

| Name      | Version    |
| --------- | ---------- |
| terraform | >= 0.12.26 |
| aws       | >= 2.48    |

## Providers

| Name | Version |
| ---- | ------- |
| aws  | >= 2.48 |

| Phase    | Equivalent `Terraform` Command |
| -------- | ------------------------------ |
| Planning | `terraform plan`               |
| Creation | `terraform apply`              |
| Update   | `terraform apply`              |
| Deletion | `terraform destroy`            |

## Usage

```
module "log_bucket" {
  source = "./s3"

  bucket_name        = "kushal-bucket-example2-bucket"
  bucket_acl         = "private"
  env                = "ENV"
  enabled_versioning = true
  policy             = <<EOF
  {
    "Version": "2008-10-17",
    "Statement": [
      {
        "Sid": "PublicReadForGetBucketObjects",
        "Effect": "Allow",
        "Principal": {
          "AWS": "*"
        },
        "Action": "s3:GetObject",
        "Resource": "arn:aws:s3:::${var.bucket_name}/*"
      }
    ]
  }
  EOF
}
```

`# NOTE : Bucket policy should be provided.`

## Inputs

```
bucket_name                     string
bucket_acl                      string
env                             string
enabled_versioning              string
policy                          string
```

**NOTE : `terraform.tfvars` file should be created and the above used variables should be initialized it the file.**

## Running locally.

**Clone the repository.**

```
# Initialize terraform.

make init

# Show resources to be created.

make plan

# Create resources.

make apply

```
