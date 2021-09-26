# Creates a vpc endpint for the provides service.
resource "aws_vpc_endpoint" "default" {
  vpc_id       = var.vpc_id
  service_name = var.service_name

  tags = {
    Environment = var.env
  }
}
