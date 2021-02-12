variable "service_name" {}
variable "env" {}

variable "instance_params" {
  type = object({
    replication_instance_class = string
    allocated_storage          = number
    availability_zone          = string
    publicly_accessible        = bool
    subnet_ids                 = list(string)
    vpc_security_group_ids     = list(string)
  })
}

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

    schema_name = string
    table_name  = string
  }))
}

