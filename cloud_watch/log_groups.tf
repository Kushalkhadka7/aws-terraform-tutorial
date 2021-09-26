resource "aws_cloudwatch_log_group" "vpc_flow_logs" {
  name = "vpc_flow_logs"

  tags = {
    Environment = "production"
    Application = "serviceA"
  }
}


resource "aws_cloudwatch_log_group" "asg_logs" {
  name = "asg_logs"

  tags = {
    Environment = "production"
    Application = "serviceA"
  }
}
