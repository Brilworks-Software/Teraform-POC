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

