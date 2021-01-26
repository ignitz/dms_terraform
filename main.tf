data "aws_region" "current" {}

module "dms" {
  source = "./dms"

  # Endpoints params
  service_name     = var.service_name
  env              = var.env
  region           = data.aws_region.current.name
  server_name      = var.server_name
  database_port    = var.database_port
  database_name    = var.database_name
  username         = var.username
  password         = var.password
  ssl_mode         = var.ssl_mode
  bucket_name      = var.bucket_name
  bucket_folder    = var.bucket_folder
  compression_type = var.compression_type

  # Replication instance params
  replication_instance_class = "dms.t2.micro"
  allocated_storage          = 50
  availability_zone          = "${data.aws_region.current.name}a"
  publicly_accessible        = false
  subnet_ids                 = var.subnet_ids
  vpc_security_group_ids     = var.vpc_security_group_ids

  # Replication task params
  # Use like SQL with % to include multiple tables
  schema_name = "public"
  table_name  = "%"
}

# To autostart this tasks
# https://github.com/hashicorp/terraform-provider-aws/issues/2083

output "data" {
  value = module.dms
}
