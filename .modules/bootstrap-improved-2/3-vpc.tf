module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name            = local.name
  cidr            = local.vpc_cidr
  azs             = local.azs
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 4, k)]
  public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 48)]

  enable_nat_gateway = true
  single_nat_gateway = true

  #  public_subnet_tags = {
  #    "kubernetes.io/role/elb" = 1
  #  }
  #  private_subnet_tags = {
  #    "kubernetes.io/role/internal-elb" = 1
  #  }

  tags = local.tags
}


#data "aws_availability_zones" "azs" {}

locals {
  name     = "s2b"
  vpc_cidr = "10.0.0.0/16"
  azs      = ["ap-northeast-2a"]

  tags = {
    Name       = local.name
    GithubOrg  = "Smile2Buy"
    GithubRepo = "s2b-infra"
  }
}