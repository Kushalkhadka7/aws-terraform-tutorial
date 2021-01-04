resource "aws_db_instance" "default_rds" {
  instance_class              = "db.t2.micro"
  name                        = var.name
  engine                      = var.engine
  allocated_storage           = var.storage_size
  max_allocated_storage       = var.storage_max
  apply_immediately           = var.apply_immediately
  backup_retention_period     = var.backup_retention_period
  backup_window               = var.backup_window
  maintenance_window          = var.maintenance_window
  username                    = var.db_username
  password                    = var.dn_password
  engine_version              = var.engine_version
  db_subnet_group_name        = aws_db_subnet_group.default_db_subnet_group.name
  allow_major_version_upgrade = var.allow_major_version_upgrade
  delete_automated_backups    = false
  deletion_protection         = true
  multi_az                    = true
  port                        = var.port

  tags = {
    Name          = var.name
    "enviornment" = var.env
  }

  provisioner "local-exec" {
    command = "shackle db bootstrap"

    environment = {
      DB_INSTANCE = aws_db_instance.default_rds.identifier
    }
  }
}
