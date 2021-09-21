resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.public_subnet[0].id

  tags = {
    Name = "Nat gateway"
  }

  # Elastic ip should be enabled first.
  depends_on = [aws_eip.elastic_ip]
}
