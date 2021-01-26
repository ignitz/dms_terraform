# Source endpoint
resource "aws_dms_endpoint" "source" {
  endpoint_id   = "${var.service_name}-endpoint-source-database-${var.env}"
  endpoint_type = "source"
  engine_name   = "postgres"

  database_name = var.database_name
  username      = var.username
  password      = var.password
  port          = var.database_port
  server_name   = var.server_name
  ssl_mode      = var.ssl_mode

  tags = {
    Name = "${var.service_name}-endpoint-source-database-${var.env}"
    Env  = var.env
  }
}


# Target endpoint
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dms_endpoint#s3_settings-arguments
resource "aws_dms_endpoint" "target" {
  endpoint_id                 = "${var.service_name}-endpoint-target-s3-${var.env}"
  endpoint_type               = "target"
  engine_name                 = "s3"
  extra_connection_attributes = "dataFormat=parquet;parquetVersion=parquet_2_0;"

  s3_settings {
    bucket_name             = var.bucket_name
    bucket_folder           = var.bucket_folder
    compression_type        = var.compression_type
    date_partition_enabled  = true
    service_access_role_arn = aws_iam_role.iam_for_s3target_endpoint.arn
  }

  tags = {
    Name = "${var.service_name}-endpoint-source-database-${var.env}"
    Env  = var.env
  }
}

