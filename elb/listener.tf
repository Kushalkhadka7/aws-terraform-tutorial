resource "aws_alb_listener" "alb_listener" {
  load_balancer_arn = aws_alb.application_lb.arn
  port              = 80
  protocol          = "Http"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}


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
      values = ["/admin/*"]
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
