variable "vpc_cidr" {
  default = "192.168.0.0/16"
  type    = string
}

variable "vpc_name" {
  default = ""
  type    = string
}

variable "private_subnet_cidr" {
  default = "192.168.1.0/24"
  type    = string
}

variable "public_subnet_cidr" {
  default = "192.168.2.0/24"
  type    = string
}

variable "private_subnet_name" {
  default = ""
  type    = string
}

variable "public_subnet_name" {
  default = ""
  type    = string
}

variable "aws_availability_zones_available" {
  default = []
  type    = list(string)
}

variable "private_route_cidr" {
  default = ""
  type    = string
}


variable "public_route_cidr" {
  default = "0.0.0.0/0"
  type    = string
}
