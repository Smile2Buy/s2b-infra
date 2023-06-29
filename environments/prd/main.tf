provider "aws" {
  region = local.common.aws_region
}

module "network" {
  source       = "../../layers/network"
  organization = local.common.organization
  environment  = local.common.environment
  config       = local.network
}