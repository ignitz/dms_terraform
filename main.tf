data "aws_region" "current" {}

module "dms" {
  source = "./dms"

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

  # Replication instance params
  replication_instance_class = var.servers[count.index].replication_instance_class
  allocated_storage          = var.servers[count.index].allocated_storage
  availability_zone          = var.servers[count.index].availability_zone
  publicly_accessible        = var.servers[count.index].publicly_accessible
  subnet_ids                 = var.servers[count.index].subnet_ids
  vpc_security_group_ids     = var.servers[count.index].vpc_security_group_ids

  # Replication task params
  # Use like SQL with % to include multiple tables
  schema_name = var.servers[count.index].schema_name
  table_name  = var.servers[count.index].table_name
}
