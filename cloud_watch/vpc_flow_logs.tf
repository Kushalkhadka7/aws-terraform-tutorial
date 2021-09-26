resource "aws_flow_log" "vpc_flow_log" {
  iam_role_arn    = aws_iam_role.flow_logs.arn
  log_destination = aws_cloudwatch_log_group.vpc_flow_logs.arn
  traffic_type    = "ALL"
  vpc_id          = var.aws_vpc


  tags = {
    Name = "Vpc flow logs"
  }

  depends_on = [
    aws_cloudwatch_log_group.vpc_flow_logs
  ]
}


# IAM role that allows to write to cloud watch logs.
resource "aws_iam_role" "flow_logs" {
  name = "vpc_flow_logs"

  assume_role_policy = <<EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Sid": "",
          "Effect": "Allow",
          "Principal": {
            "Service": "vpc-flow-logs.amazonaws.com"
          },
          "Action": "sts:AssumeRole"
        }
      ]
    }
    EOF
}


# IAM policy that is attached to the role that allows to write to cloud watch logs.
resource "aws_iam_role_policy" "flow_logs" {
  name = "example"
  role = aws_iam_role.flow_logs.id

  policy = <<EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents",
            "logs:DescribeLogGroups",
            "logs:DescribeLogStreams"
          ],
          "Effect": "Allow",
          "Resource": "*"
        }
      ]
    }
    EOF
}
