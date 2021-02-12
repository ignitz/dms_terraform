variable "service_name" {
  type        = string
  description = "Name of service to insert in endpoint_id"
}

variable "env" {
  type        = string
  description = "Environment variable where are deployed."
}

variable "region" {
  type        = string
  description = "Region where the resources are to be deployed. Ex: us-east-1"
}

###################################################################################################################
# Source endpoint
###################################################################################################################

variable "server_name" {
  type        = string
  description = "The host name of the server."
}

variable "database_port" {
  type        = number
  default     = 5432
  description = "The port used by the endpoint database."
}

variable "database_name" {
  type        = string
  description = "The name of the endpoint database."
}

variable "username" {
  type        = string
  description = "The user name to be used to login to the endpoint database."
}

variable "password" {
  type        = string
  description = "The password to be used to login to the endpoint database."
}

variable "ssl_mode" {
  type        = string
  default     = "none"
  description = "The SSL mode to use for the connection. Can be one of none | require | verify-ca | verify-full."

  validation {
    condition     = contains(["none", "require", "verify-ca", "verify-full"], var.ssl_mode)
    error_message = "Allowed values for compression_type are \"none\", \"require\", \"verify-ca\", \"verify-full\"."
  }
}

###################################################################################################################
# Target endpoint
###################################################################################################################

variable "bucket_folder" {
  description = "S3 Bucket Object prefix to target endpoint."
}

variable "bucket_name" {
  type        = string
  description = "Bucket name to S3 target endpoint."
}

variable "compression_type" {
  type        = string
  default     = "NONE"
  description = "An optional parameter when set to GZIP uses GZIP to compress the target .csv or .parquet files. When this parameter is set to the default, it leaves the files uncompressed."

  validation {
    condition     = contains(["NONE", "GZIP"], var.compression_type)
    error_message = "Allowed values for compression_type are \"NONE\", \"GZIP\"."
  }
}

###################################################################################################################
# Replication Task
###################################################################################################################

variable "migration_type" {
  type        = string
  default     = "full-load-and-cdc"
  description = "The migration type. Can be one of full-load | cdc | full-load-and-cdc."

  validation {
    condition     = contains(["full-load", "cdc", "full-load-and-cdc"], var.migration_type)
    error_message = "Allowed values for replication_instance_class are \"full-load\", \"cdc\", \"full-load-and-cdc\"."
  }
}

variable "replication_instance_arn" {
  type        = string
  description = "ARN of replication instance that task will use."
}
variable "schema_name" {
  type        = string
  description = "Filter schema(s) in database with Like syntax. Ex: public, %."
}

variable "table_name" {
  type        = string
  description = "Filter table(s) in database with Like syntax. Ex: users, %users%, %."
}
