###################################################################################################################
# Replication Instance
###################################################################################################################

variable "replication_instance_class" {
  type        = string
  default     = "dms.t2.micro"
  description = "The compute and memory capacity of the replication instance as specified by the replication instance class. Can be one of dms.t2.micro | dms.t2.small | dms.t2.medium | dms.t2.large | dms.c4.large | dms.c4.xlarge | dms.c4.2xlarge | dms.c4.4xlarge."

  validation {
    condition     = contains(["dms.t2.micro", "dms.t2.small", "dms.t2.medium", "dms.t2.large", "dms.c4.large", "dms.c4.xlarge", "dms.c4.2xlarge", "dms.c4.4xlarge"], var.replication_instance_class)
    error_message = "Allowed values for replication_instance_class are \"dms.t2.micro\", \"dms.t2.small\", \"dms.t2.medium\", \"dms.t2.large\", \"dms.c4.large\", \"dms.c4.xlarge\", \"dms.c4.2xlarge\", \"dms.c4.4xlarge\"."
  }
}

variable "engine_version" {
  type        = string
  default     = "3.4.3"
  description = "Engine version of replication instance. Choose 3.4.1 and above to support S3_TARGET_DATE_PARTITION feature."

  validation {
    condition     = contains(["3.4.1", "3.4.2", "3.4.3"], var.engine_version)
    error_message = "Allowed values for engine_version are \"3.4.1\", \"3.4.2\", \"3.4.3\"."
  }
}

variable "allocated_storage" {
  type        = number
  default     = 50
  description = "(Default: 50, Min: 5, Max: 6144) The amount of storage (in gigabytes) to be initially allocated for the replication instance."
}

variable "availability_zone" {
  type        = string
  description = "Availability zone where the instance will be deployed. Ex: us-east-1a"
}
variable "subnet_ids" {
  type        = list(string)
  description = "List of subnets to allow connect to database with internet network and security group."
}

variable "publicly_accessible" {
  type        = bool
  default     = false
  description = "Specifies the accessibility options for the replication instance. A value of true represents an instance with a public IP address. A value of false represents an instance with a private IP address."
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "A list of VPC security group IDs to be used with the replication instance. The VPC security groups must work with the VPC containing the replication instance."
}
