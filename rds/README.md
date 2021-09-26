# AWS RDS

Terraform module which creates relational database instance in aws (RDS).
Create a subnet group to associate the RDS with it.

## Requirements

| Name      | Version    |
| --------- | ---------- |
| terraform | >= 0.12.26 |
| aws       | >= 2.48    |

## Providers

| Name | Version | \*\*\*\* |
| ---- | ------- | -------- |
| aws  | >= 2.48 |

| Phase    | Equivalent `Terraform` Command |
| -------- | ------------------------------ |
| Planning | `terraform plan`               |
| Creation | `terraform apply`              |
| Update   | `terraform apply`              |
| Deletion | `terraform destroy`            |

## Usage

```
# module "admin_rds" {
#   source = "./rds"

#   name                    = var.name
#   engine                  = var.engine
#   storage_size            = var.storage_size
#   storage_max             = var.storage_max
#   apply_immediately       = var.apply_immediately
#   backup_retention_period = var.backup_retention_period
#   backup_window           = var.backup_window
#   maintenance_window      = var.maintenance_window
#   db_username             = var.db_username
#   dn_password             = var.dn_password
#   engine_version          = var.engine_version
#   subnet_ids              = module.aws_vpc.private_subnet.ids
#   vpc_security_group_ids  = var.vpc_security_group_ids
# }
```

## Inputs

```
engine                      string
storage_size                number
storage_max                 number
apply_immediately           bool
backup_retention_period     number
backup_window               string eg "04:00-05:00"
maintenance_window          string eg "04:00-05:00"
db_username                 string
dn_password                 string
engine_version              string
subnet_ids                  list(string)
vpc_security_group_ids      list(string)
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
