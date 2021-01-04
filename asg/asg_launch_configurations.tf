resource "aws_launch_configuration" "default" {
  image_id          = var.ec2_image_id
  instance_type     = var.ec2_instance_type
  security_groups   = var.ec2_security_groups
  enable_monitoring = var.enable_monitoring
  ebs_optimized     = var.ebs_optimized

  lifecycle {
    create_before_destroy = true
  }

  ebs_block_device {
    device_name           = "/dev/xvdz"
    volume_type           = "gp2"
    volume_size           = "50"
    delete_on_termination = true
  }


  root_block_device {
    volume_size = "50"
    volume_type = "gp2"
  }
}
