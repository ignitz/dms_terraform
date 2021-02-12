data "aws_region" "current" {}

module "dms_tasks" {
  source = "./dms_tasks"

  count = length(var.servers)

  service_name = var.service_name
  env          = var.env
  region       = data.aws_region.current.name

  # Endpoints params
  server_name      = var.servers[count.index].server_name
  database_port    = var.servers[count.index].database_port
  database_name    = var.servers[count.index].database_name
  username         = var.servers[count.index].username
  password         = var.servers[count.index].password
  ssl_mode         = var.servers[count.index].ssl_mode
  bucket_name      = var.servers[count.index].bucket_name
  bucket_folder    = var.servers[count.index].bucket_folder
  compression_type = var.servers[count.index].compression_type

  # Replication task params
  # Use like SQL with % to include multiple tables
  replication_instance_arn = module.dms_instance.replication_instance.replication_instance_arn
  schema_name              = var.servers[count.index].schema_name
  table_name               = var.servers[count.index].table_name
}

module "dms_instance" {
  source = "./dms_instance"

  # Replication instance params
  replication_instance_class = var.instance_params.replication_instance_class
  allocated_storage          = var.instance_params.allocated_storage
  availability_zone          = var.instance_params.availability_zone
  publicly_accessible        = var.instance_params.publicly_accessible
  subnet_ids                 = var.instance_params.subnet_ids
  vpc_security_group_ids     = var.instance_params.vpc_security_group_ids
}
