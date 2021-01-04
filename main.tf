terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "aws_vpc" {
  source                           = "./vpc"
  vpc_cidr                         = var.aws_vpc_cidr
  vpc_name                         = var.aws_vpc_name
  public_subnet_cidr               = var.public_subnet_cidr
  public_subnet_name               = var.public_subnet_name
  private_subnet_cidr              = var.private_subnet_cidr
  private_subnet_name              = var.private_subnet_name
  aws_availability_zones_available = data.aws_availability_zones.available.names
}

output "name" {
  value = module.aws_vpc.private_subnet
}

# Admin auto-scaling group.
module "admin_asg" {
  source                    = "./asg"
  asg_name                  = var.admin_asg_name
  min_size                  = var.min_size
  max_size                  = length(data.aws_availability_zones.available.names) * 2
  health_check_type         = var.health_check_type
  health_check_grace_period = var.health_check_grace_period
  subnets                   = module.aws_vpc.private_subnet.ids
  desired_capacity          = length(data.aws_availability_zones.available.names)

  # launch configurations.
  ec2_image_id           = "ami-04d29b6f966df1537"
  ec2_instance_type      = var.ec2_instance_type
  ec2_security_groups    = [aws_security_group.ec2_security_group.id]
  enable_monitoring      = var.enable_monitoring
  ebs_optimized          = var.ebs_optimized
  ebs_device_name        = var.ebs_device_name
  volume_type            = var.volume_type
  volume_size            = var.volume_size
  delete_on_termination  = var.delete_on_termination
  root_block_device_size = var.root_block_device_size
  root_block_device_type = var.root_block_device_type

  # Scale down policy.
  scale_down_policy_name        = var.scale_down_policy_name
  scale_down_scaling_adjustment = var.scale_down_scaling_adjustment
  scale_down_adjustemnt_type    = var.scale_down_adjustemnt_type
  scale_down_cool_down          = var.scale_down_cool_down
  scale_down_policy_type        = var.scale_down_policy_type

  # Scale up policy.
  scale_up_policy_name        = var.scale_up_policy_name
  scale_up_scaling_adjustment = var.scale_up_scaling_adjustment
  scale_up_adjustemnt_type    = var.scale_up_adjustemnt_type
  scale_up_cool_down          = var.scale_up_cool_down
  scale_up_policy_type        = var.scale_up_policy_type
}


module "admin_rds" {
  source = "./rds"

  name                    = var.name
  engine                  = var.engine
  storage_size            = var.storage_size
  storage_max             = var.storage_max
  apply_immediately       = var.apply_immediately
  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window
  maintenance_window      = var.maintenance_window
  db_username             = var.db_username
  dn_password             = var.dn_password
  engine_version          = var.engine_version
  subnet_ids              = module.aws_vpc.private_subnet.ids
  vpc_security_group_ids  = var.vpc_security_group_ids
}

module "auth_db" {
  source         = "./dynamo"
  table_name     = var.table_name
  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.hash_key
  range_key      = var.range_key
  stream_enabled = var.stream_enabled
  env            = "dev"
  hash_key_type  = "S"
  range_key_type = "S"
}

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
}

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



module "s3_bucket_example" {
  source = "./s3"

  bucket_name        = var.bucket_name
  bucket_acl         = var.bucket_acl
  env                = var.env
  enabled_versioning = var.enabled_versioning
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


module "vpc_s3_endpoint" {
  source = "./vpc_endpoint"

  vpc_id       = module.aws_vpc.default_vpc.id
  service_name = "com.amazonaws.us-east-1.s3"
  env          = "PROD"

}
