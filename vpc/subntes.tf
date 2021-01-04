resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.default_vpc.id
  map_public_ip_on_launch = true
  count                   = length(var.aws_availability_zones_available)
  availability_zone       = var.aws_availability_zones_available[count.index]
  cidr_block              = format("192.168.%d.0/24", count.index + 50)

  tags = {
    Name = format("Private_subnet_%s", var.aws_availability_zones_available[count.index])
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.default_vpc.id
  map_public_ip_on_launch = true
  count                   = length(var.aws_availability_zones_available)
  availability_zone       = var.aws_availability_zones_available[count.index]
  cidr_block              = format("192.168.%d.0/24", count.index + 1)

  tags = {
    Name = format("Public_subnet_%s", var.aws_availability_zones_available[count.index])
  }
}

resource "aws_route_table_association" "priavet_rt_association" {
  count          = length(var.aws_availability_zones_available)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.private_rt.id

  depends_on = [aws_route_table.private_rt, aws_subnet.private_subnet]
}


resource "aws_route_table_association" "public_rt_association" {
  count          = length(var.aws_availability_zones_available)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public_rt.id

  depends_on = [aws_route_table.public_rt, aws_subnet.public_subnet]
}
