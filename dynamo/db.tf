resource "aws_dynamodb_table" "default" {
  name           = var.table_name
  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.hash_key
  range_key      = var.range_key
  stream_enabled = var.stream_enabled


  attribute {
    name = var.hash_key
    type = var.hash_key_type
  }

  attribute {
    name = var.range_key
    type = var.range_key_type
  }


  ttl {
    attribute_name = "evaluatedAt"
    enabled        = var.ttl_enabled
  }

  tags = {
    Name        = var.table_name
    Enviornment = var.env
  }
}
