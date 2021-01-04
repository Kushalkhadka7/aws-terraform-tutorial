variable "name" {
  default = ""
  type    = string
}

variable "internal" {
  default = false
  type    = bool
}

variable "load_balancer_type" {
  default = ""
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
