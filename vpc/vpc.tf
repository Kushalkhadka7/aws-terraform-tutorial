# Vpc Resource.
resource "aws_vpc" "default_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name
  }
}

# Enable elastic_ip to be assigned and use inside the vpc.
resource "aws_eip" "elastic_ip" {
  vpc = true
}

