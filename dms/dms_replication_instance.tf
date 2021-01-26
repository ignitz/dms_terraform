# Create a new replication instance
resource "aws_dms_replication_instance" "replication_instance" {
  allocated_storage = var.allocated_storage
  apply_immediately = true
  #   auto_minor_version_upgrade = true
  availability_zone = var.availability_zone
  engine_version    = var.engine_version
  #   kms_key_arn                = "arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012"
  #   multi_az = false
  #   preferred_maintenance_window = "sun:10:30-sun:14:30"
  publicly_accessible         = var.publicly_accessible
  replication_instance_class  = var.replication_instance_class
  replication_instance_id     = "${var.service_name}-dms-replication-instance-${var.env}"
  replication_subnet_group_id = aws_dms_replication_subnet_group.dms_subnet_group.id


  tags = {
    Name = "${var.service_name}-dms-replication_instance-${var.env}"
    Env  = var.env
  }

  vpc_security_group_ids = var.vpc_security_group_ids
}

resource "aws_dms_replication_subnet_group" "dms_subnet_group" {
  replication_subnet_group_id          = "${var.service_name}-dms-subnetgroup-${var.env}"
  replication_subnet_group_description = "Replication subnet group"

  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.service_name}-dms-subnetgroup-${var.env}"
    Env  = var.env
  }
}
