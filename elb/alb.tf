# Application load balancer to distribute load across auto scaling groups.
resource "aws_alb" "application_lb" {
  name                             = var.name
  internal                         = var.internal
  load_balancer_type               = var.load_balancer_type
  security_groups                  = var.security_groups
  enable_http2                     = var.enable_http2
  enable_cross_zone_load_balancing = var.cross_zone_load_balancing
  idle_timeout                     = var.idle_timeout
  subnets                          = var.subnets
  enable_deletion_protection       = var.enable_deletion_protection

  access_logs {
    enabled = var.enable_access_logs
    bucket  = var.alb_logs_bucket_name
    prefix  = var.alb_logs_bucket_prefix
  }

  tags = {
    Name        = var.name
    Enviornment = var.alb_env
  }
}
