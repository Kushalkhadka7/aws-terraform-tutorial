# Creates a new s3 bucket with give acl and name.
resource "aws_s3_bucket" "default" {
  bucket = var.bucket_name
  acl    = var.bucket_acl

  tags = {
    Name        = var.bucket_name
    Enviornment = var.env
  }

  versioning {
    enabled = var.enabled_versioning
  }
}


