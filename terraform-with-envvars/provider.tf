terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Configure the AWS Provider
provider "aws" {
  alias = "region-west"
  region = "us-west-1"
}