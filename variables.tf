variable "service_name" {}
variable "env" {}

variable "servers" {
  type = list(object({
    server_name      = string
    database_port    = number
    database_name    = string
    username         = string
    password         = string
    ssl_mode         = string
    bucket_name      = string
    bucket_folder    = string
    compression_type = string

    replication_instance_class = string
    allocated_storage          = number
    availability_zone          = string
    publicly_accessible        = bool
    subnet_ids                 = list(string)
    vpc_security_group_ids     = list(string)

    only_fullload = bool
    schema_name   = string
    table_name    = string
  }))
}

