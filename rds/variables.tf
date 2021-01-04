variable "name" {
  default = ""
  type    = string
}

variable "engine" {
  default = ""
  type    = string
}

variable "storage_size" {
  default = 20
  type    = number
}

variable "storage_max" {
  default = 40
  type    = number
}

variable "apply_immediately" {
  default = false
  type    = bool
}

variable "backup_retention_period" {
  default = 7
  type    = number
}

variable "backup_window" {
  default = "04:00-05:00"
  type    = string
}

variable "maintenance_window" {
  default = "04:00-05:00"
  type    = string
}

variable "db_username" {
  default = ""
  type    = string
}

variable "dn_password" {
  default = ""
  type    = string
}

variable "engine_version" {
  default = ""
  type    = string
}

variable "subnet_group_name" {
  type    = string
  default = ""
}


variable "vpc_security_group_ids" {
  type    = list(string)
  default = []
}

variable "allow_major_version_upgrade" {
  type    = bool
  default = false
}

variable "allow_minor_version_upgrade" {
  type    = bool
  default = true
}


variable "subnet_ids" {
  type    = list(string)
  default = []
}

variable "env" {
  type    = string
  default = "dev"
}

variable "tags" {
  type    = string
  default = "db"
}

variable "port" {
  type    = string
  default = "3306"
}
