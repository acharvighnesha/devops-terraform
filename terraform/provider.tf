terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.27.0"
    }
  }

backend "s3" {
    bucket = "terraform-vignesh"
    key    = "demo/terraform.tfstate"
    region = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}