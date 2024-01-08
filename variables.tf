variable "aws_region" {
  default     = "us-east-1"
  type        = string
  description = "value of the region"
}

variable "bucket_name" {
  default     = "bucket-name"
  type        = string
  description = "value of the bucket name"
}

variable "index_file_path" {
  default     = "./index.html" // This will be the directory path to the index.html file, sample file is present in the repo
  type        = string
  description = "value of the index file path"
}

variable "index_file_name" {
  default     = "index.html"
  type        = string
  description = "value of the index file name"
}

variable "index_document" {
  default     = "index.html"
  type        = string
  description = "value of the default file name"
}

variable "error_document" {
  default     = "index.html"
  type        = string
  description = "value of the error file name"
}

// Some RDS variables
variable "rds_username" {
  default     = "admin_user"
  type        = string
  description = "value of the rds username"
}

variable "rds_db_name" {
  default     = "sample-db"
  type        = string
  description = "value of the rds db name"
}

variable "rds_db_port" {
  default     = 3306
  type        = number
  description = "value of the rds db port"
}

variable "rds_db_engine" {
  default     = "mysql"
  type        = string
  description = "value of the rds db engine"
}

variable "rds_db_engine_version" {
  default     = "8.0.35"
  type        = string
  description = "value of the rds db engine version"
}

variable "rds_db_instance_class" {
  default     = "db.t2.micro"
  type        = string
  description = "value of the rds db instance class"
}

variable "rds_db_storage_size" {
  default     = 10
  type        = number
  description = "value of the rds db storage size"
}

variable "rds_db_tag" {
  default     = "SampleRDSInstance"
  type        = string
  description = "value of the rds db tag"

}

variable "rds_db_parameter_group_family" {
  default     = "mysql8.0"
  type        = string
  description = "value of the rds db parameter group family"
}

variable "rds_db_skip_final_snapshot" {
  default     = true
  type        = bool
  description = "value of the rds db skip final snapshot"
}

variable "rds_db_publicly_accessible" {
  default     = true
  type        = bool
  description = "value of the rds db publicly accessible"
}
