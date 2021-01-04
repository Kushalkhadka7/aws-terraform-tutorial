variable "table_name" {
  type    = string
  default = ""
}

variable "billing_mode" {
  type    = string
  default = ""
}

variable "read_capacity" {
  type    = number
  default = 1
}

variable "write_capacity" {
  type    = number
  default = 1
}

variable "hash_key" {
  type    = string
  default = ""
}

variable "range_key" {
  type    = string
  default = ""
}

variable "stream_enabled" {
  type    = bool
  default = false
}

variable "ttl_enabled" {
  type    = bool
  default = false
}

variable "env" {
  default = "dev"
  type    = string
}


variable "hash_key_type" {
  type    = string
  default = ""
}

variable "range_key_type" {
  type    = string
  default = ""
}
