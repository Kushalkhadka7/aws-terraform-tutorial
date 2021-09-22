variable "name" {
  default = ""
  type    = string
}

variable "internal" {
  default = false
  type    = bool
}

variable "load_balancer_type" {
  default = "application"
  type    = string
}

variable "availability_zones" {
  default = []
  type    = list(string)
}

variable "security_groups" {
  default = []
  type    = list(string)
}

variable "cross_zone_load_balancing" {
  default = true
  type    = bool
}

variable "enable_http2" {
  default = false
  type    = bool
}

variable "enable_access_logs" {
  default = false
  type    = bool
}

variable "alb_logs_bucket_name" {
  default = "load_balancer"
  type    = string
}

variable "alb_logs_bucket_prefix" {
  default = "load_balancer/"
  type    = string
}

variable "alb_env" {
  default = "dev"
  type    = string
}

variable "idle_timeout" {
  default = 400
  type    = number
}

variable "connection_draining" {
  default = true
  type    = bool
}

variable "connection_draining_timeout" {
  default = 400
  type    = number
}

variable "subnets" {
  default = []
  type    = list(string)
}

variable "enable_deletion_protection" {
  default = true
  type    = bool
}

variable "alb_listener_port" {
  default = 80
  type    = number
}

variable "alb_listener_protocol" {
  default = "Http"
  type    = string
}


variable "route_path_pattern" {
  default = ["/admin/*"]
  type    = list(string)
}
