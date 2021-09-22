# AWS Application Load Balancer (ALB)

Creates a application load balancer (ALB), along with listeners and listeners rules associated with it.

## Requirements

| Name      | Version    |
| --------- | ---------- |
| terraform | >= 0.12.26 |
| aws       | >= 2.48    |

**Need to create a VPC and subnets first so that we can use the subnets ids in the ALB, or default VPC can be used.**

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

```hcl
module "alb" {
  source = "./elb"

  name                        = "Application-Load-Balancer"
  internal                    = var.internal
  load_balancer_type          = var.load_balancer_type
  security_groups             = [aws_security_group.elb_security_group.id]
  cross_zone_load_balancing   = var.cross_zone_load_balancing
  idle_timeout                = var.idle_timeout
  connection_draining         = var.connection_draining
  connection_draining_timeout = var.connection_draining_timeout
  subnets                     = module.aws_vpc.private_subnet.ids
  enable_http2                = var.enable_http2
  enable_access_logs          = var.enable_access_logs
  alb_logs_bucket_name        = var.alb_logs_bucket_name
  alb_logs_bucket_prefix      = var.alb_logs_bucket_prefix
  alb_env                     = var.alb_env
  alb_listener_port           = var.alb_listener_port
  alb_listener_protocol       = var.alb_listener_protocol
  route_path_pattern          = var.route_path_pattern
}
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

**NOTE : After creating the alb we need to make target_group and attach the alb with it.**
