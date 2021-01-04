variable "bucket_name" {
  default = ""
  type    = string
}

variable "bucket_acl" {
  default = ""
  type    = string
}

variable "env" {
  default = ""
  type    = string
}

variable "enabled_versioning" {
  default = false
  type    = bool
}

variable "policy" {
  default = ""
  type    = string
}
