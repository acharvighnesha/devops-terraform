module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vighnesha-vpc-${var.env}"
  cidr = var.vpc_cidr

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = var.env
    Batch = "c34"
  }
}