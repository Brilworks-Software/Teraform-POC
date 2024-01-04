terraform {
  required_providers {
    aws = {
      version = "~> 5.31.0"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}
