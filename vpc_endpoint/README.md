# AWS Vpc End Points

Terraform module which creates vpc end points for the resources outside of the vpc to interact with the resources inside the VPC.

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
module "vpc_s3_endpoint" {
  source = "./vpc_endpoint"

  vpc_id       = aws_vpc.default_vpc.id
  service_name = "com.amazonaws.us-east-1.s3"
  env          = "PROD"
}
```

## Inputs

```
vpc_id                  string
service_name            string
env                     string
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
