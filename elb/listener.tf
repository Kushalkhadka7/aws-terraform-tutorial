# Application load balancer listener.
resource "aws_alb_listener" "alb_listener" {
  load_balancer_arn = aws_alb.application_lb.arn
  port              = var.alb_listener_port
  protocol          = var.alb_listener_protocol

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}

# Application load balancer listener rule.
resource "aws_lb_listener_rule" "admin_rule" {
  listener_arn = aws_alb_listener.alb_listener.arn

  action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "HEALTHY"
      status_code  = "200"
    }
  }

  condition {
    path_pattern {
      values = var.route_path_pattern
    }
  }

  condition {
    query_string {
      key   = "health"
      value = "check"
    }

    query_string {
      value = "bar"
    }
  }
}
