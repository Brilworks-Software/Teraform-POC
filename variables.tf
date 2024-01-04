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
