variable "scale_up_policy_name" {
  default = ""
  type    = string
}

variable "scale_up_scaling_adjustment" {
  default = 3
  type    = number
}

variable "scale_up_adjustemnt_type" {
  default = ""
  type    = string
}

variable "scale_up_cool_down" {
  default = 300
  type    = number
}

variable "scale_up_policy_type" {
  default = ""
  type    = string
}

variable "auto_scaling_group_name" {
  default = ""
  type    = string
}

variable "scale_down_policy_name" {
  default = ""
  type    = string
}

variable "scale_down_scaling_adjustment" {
  default = 1
  type    = number
}

variable "scale_down_adjustemnt_type" {
  default = ""
  type    = string
}

variable "scale_down_cool_down" {
  default = 300
  type    = number
}

variable "scale_down_policy_type" {
  default = ""
  type    = string
}

variable "asg_name" {
  default = ""
  type    = string
}

variable "availability_zones" {
  default = []
  type    = list(string)
}

variable "min_size" {
  default = 1
  type    = number
}

variable "max_size" {
  default = 6
  type    = number
}

variable "health_check_type" {
  default = ""
  type    = string
}

variable "health_check_grace_period" {
  default = ""
  type    = string
}

variable "desired_capacity" {
  default = 1
  type    = number
}

variable "launch_configurations_namevariable" {
  default = ""
  type    = string
}

variable "ec2_image_id" {
  default = ""
  type    = string
}

variable "ec2_instance_type" {
  default = ""
  type    = string
}

variable "ec2_security_groups" {
  default = []
  type    = list(string)
}

variable "enable_monitoring" {
  default = false
  type    = bool
}

variable "ebs_optimized" {
  default = false
  type    = bool
}

variable "delete_on_termination" {
  default = false
  type    = bool
}




variable "ebs_device_name" {
  default = ""
  type    = string
}

variable "volume_type" {
  default = ""
  type    = string
}

variable "volume_size" {
  default = ""
  type    = string
}


variable "root_block_device_size" {
  default = ""
  type    = string
}

variable "root_block_device_type" {
  default = ""
  type    = string
}


variable "autoscaling_group_name" {
  default = ""
  type    = string
}


variable "subnets" {
  type = any
}
