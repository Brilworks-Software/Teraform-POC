/*
  AWS region
*/
variable "aws_region" {
  default     = "us-east-1"
  type        = string
  description = "value of the region"
}

// Some S3 variables
/*
  S3 bucket name
*/
variable "bucket_name" {
  default     = "bucket-name"
  type        = string
  description = "value of the bucket name"
}

/*
  S3 bucket index file path
  - This will be the directory path to the index.html file, sample file is present in the repo
*/
variable "index_file_path" {
  default     = "./index.html"
  type        = string
  description = "value of the index file path"
}
/*
  S3 bucket index file name
*/
variable "index_file_name" {
  default     = "index.html"
  type        = string
  description = "value of the index file name"
}
/*
  S3 bucket index document
*/
variable "index_document" {
  default     = "index.html"
  type        = string
  description = "value of the default file name"
}
/*
  S3 bucket error document
*/
variable "error_document" {
  default     = "index.html"
  type        = string
  description = "value of the error file name"
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
variable "rds_db_instance_class" {
  type        = string
  description = "value of the rds db instance class"
}
/*
  RDS db storage size
*/
variable "rds_db_storage_size" {
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
  RDS db parameter group family
*/
variable "rds_db_parameter_group_family" {
  type        = string
  description = "value of the rds db parameter group family"
}
/*
  RDS db skip final snapshot
*/
variable "rds_db_skip_final_snapshot" {
  type        = bool
  description = "value of the rds db skip final snapshot"
}
/*
  RDS db publicly accessible
*/
variable "rds_db_publicly_accessible" {
  type        = bool
  description = "value of the rds db publicly accessible"
}

// Some Beanstalk variables
/*
  Beanstalk environment name
*/
variable "environment_name" {
  description = "A unique name for your Elastic Beanstalk environment"
  type        = string
}
/*
  Beanstalk application name
*/
variable "application_name" {
  description = "The name of your Elastic Beanstalk application"
  type        = string
}
/*
  Beanstalk solution stack name
*/
variable "solution_stack_name" {
  default     = "64bit Amazon Linux 2023 v4.1.2 running Corretto 17"
  description = "The solution stack to use for your Elastic Beanstalk environment (e.g., '64bit Amazon Linux 2023 v4.1.2 running Corretto 17')"
  type        = string
}
/*
  Beanstalk volume size
*/
variable "root_volume_size" {
  default     = 20
  description = "The size of the root volume in gigabytes"
  type        = number
}
/*
  Maximum number of instances in the Auto Scaling batch group
*/
variable "max_batch_size" {
  default     = 2
  description = "The maximum number of instances to launch in one batch"
  type        = number
}
/*
  Instance type to launch
*/
variable "instance_type" {
  description = "The type of instance to launch (e.g. t2.micro)"
  type        = string
}
/*
  Minimum number of instances in the Auto Scaling group that must be in service
*/
variable "min_instance_in_service" {
  default     = 1
  description = "The minimum number of instances that must be in service at all times"
  type        = number
}
/*
  Minimum number of instances in the Auto Scaling batch group
*/
variable "min_auto_scaling_group_size" {
  description = "The minimum number of instances in the Auto Scaling group"
  type        = number
}
/*
  Maximum number of instances in the Auto Scaling group
*/
variable "max_auto_scaling_group_size" {
  description = "The maximum number of instances in the Auto Scaling group"
  type        = number
}
// Some certificate variables
/*
  Certificate domain name
*/
variable "root_domain_name" {
  description = "The root domain name to use for the Route 53 record"
  type        = string
}

