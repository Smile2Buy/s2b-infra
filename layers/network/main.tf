locals {
  tag_name_prefix = "${var.organization}-${var.environment}"
  vpc_name        = local.tag_name_prefix
}

resource "aws_vpc" "main" {
  cidr_block           = var.config.vpc.cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = local.vpc_name
  }
}