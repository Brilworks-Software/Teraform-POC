/*
  AWS profile
*/
variable "aws_profile" {
  type        = string
  description = "value of the profile"
}
/*
  AWS region
*/
variable "aws_region" {
  default     = "us-east-1"
  type        = string
  description = "value of the region"
}

// Some RDS variables
/*
  RDS username
*/
variable "rds_username" {
  type        = string
  description = "value of the rds username"
}
/*
  RDS db name
*/
variable "rds_db_name" {
  type        = string
  description = "value of the rds db name"
}
/*
  RDS db port
*/
variable "rds_db_port" {
  type        = number
  description = "value of the rds db port"
}
/*
  RDS db engine
*/
variable "rds_db_engine" {
  type        = string
  description = "value of the rds db engine"
}
/*
  RDS db engine version
*/
variable "rds_db_engine_version" {
  type        = string
  description = "value of the rds db engine version"
}
/*
  RDS db instance class
*/
variable "rds_db_instance_type" {
  type        = string
  description = "value of the rds db instance type"
}
/*
  RDS db storage size
*/
variable "rds_db_storage_size" {
  default     = 10
  type        = number
  description = "value of the rds db storage size"
}
/*
  RDS db tag
*/
variable "rds_db_tag" {
  default     = "SampleRDSInstance"
  type        = string
  description = "value of the rds db tag"

}
/*
  RDS db skip final snapshot
*/
variable "rds_db_skip_final_snapshot" {
  default     = true
  type        = bool
  description = "value of the rds db skip final snapshot"
}
/*
  RDS db publicly accessible
*/
variable "rds_db_publicly_accessible" {
  default     = true
  type        = bool
  description = "value of the rds db publicly accessible"
}
