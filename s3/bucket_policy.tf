resource "aws_s3_bucket_policy" "default_policy" {
  bucket = aws_s3_bucket.default.id

  policy = var.policy
}
