output "endpoints" {
  value = {
    source_endpoint = aws_dms_endpoint.source
    target_endpoint = aws_dms_endpoint.target
  }
}

output "replication_instance" {
  value = aws_dms_replication_instance.replication_instance
}

output "replication_task" {
  value = aws_dms_replication_task.replication_task
}
