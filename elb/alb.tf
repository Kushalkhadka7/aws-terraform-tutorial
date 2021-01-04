resource "aws_alb" "application_lb" {
  name                             = var.name
  internal                         = var.internal
  load_balancer_type               = var.load_balancer_type
  security_groups                  = var.security_groups
  enable_cross_zone_load_balancing = var.cross_zone_load_balancing
  idle_timeout                     = var.idle_timeout
  subnets                          = var.subnets
  enable_deletion_protection       = var.enable_deletion_protection

  access_logs {
    enabled = true
    bucket  = "load_balancer"
    prefix  = "load_balancer/"
  }

  tags = {
    Name        = var.name
    Enviornment = "Prod"
  }
}
