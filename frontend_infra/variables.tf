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

/*
  S3 bucket name
*/
variable "bucket_name" {
  type        = string
  description = "value of the bucket name"
}

/*
  S3 bucket index file path
  - This will be the directory path to the index.html file, sample file is present in the repo
*/
variable "index_file_path" {
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

