output "endpoints" {
  value = {
    source = aws_dms_endpoint.source
    target = aws_dms_endpoint.target
  }
}

output "replication_task" {
  value = aws_dms_replication_task.replication_task
}
