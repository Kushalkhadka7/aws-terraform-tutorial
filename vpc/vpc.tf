resource "aws_vpc" "default_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name
  }
}


resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.default_vpc.id

  tags = {
    Name = "Internet gateway"
  }
}


resource "aws_eip" "elastic_ip" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.public_subnet[0].id

  tags = {
    Name = "Nat gateway"
  }
}
