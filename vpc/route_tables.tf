resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.default_vpc.id

  route {
    cidr_block = "0.0.0.0/0"

    gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "Private route table"
  }
}


resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.default_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

  tags = {
    Name = "Public route table"
  }
}
