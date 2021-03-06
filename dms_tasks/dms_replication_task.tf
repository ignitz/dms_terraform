resource "aws_dms_replication_task" "replication_task" {
  migration_type            = var.migration_type
  replication_instance_arn  = aws_dms_replication_instance.replication_instance.replication_instance_arn
  replication_task_id       = "${var.service_name}-dms-replication-task-${var.env}"
  replication_task_settings = file("${path.module}/dms_task_sessings.json")


  source_endpoint_arn = aws_dms_endpoint.source.endpoint_arn
  table_mappings      = "{\"rules\":[{\"rule-type\":\"selection\",\"rule-id\":\"1\",\"rule-name\":\"1\",\"object-locator\":{\"schema-name\":\"${var.schema_name}\",\"table-name\":\"${var.table_name}\"},\"rule-action\":\"include\"}]}"

  target_endpoint_arn = aws_dms_endpoint.target.endpoint_arn

  tags = {
    Name = "${var.service_name}-dms-replication-task-${var.env}"
    Env  = var.env
  }
}

