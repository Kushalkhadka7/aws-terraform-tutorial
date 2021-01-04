variable "vpc_cidr" {
  default = ""
  type    = string
}

variable "vpc_name" {
  default = ""
  type    = string
}

variable "private_subnet_cidr" {
  default = ""
  type    = string
}

variable "public_subnet_cidr" {
  default = ""
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

