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

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags   = {
    Name = "${local.vpc_name}-ig"
  }
}

module "public_subnet" {
  source = "../../modules/subnet"

  for_each = {for index, subnet in var.config.vpc.subnets : index => subnet}

  vpc_id        = aws_vpc.main.id
  subnet_config = {
    name              = "${local.tag_name_prefix}-public-${each.value.availability_zone}"
    cidr_block        = each.value.public_cidr_block
    availability_zone = each.value.availability_zone
    tags              = {}
  }
  route_table_config = {
    name  = "${local.tag_name_prefix}-public"
    route = {
      cidr_block     = "0.0.0.0/0"
      gateway_id     = aws_internet_gateway.main.id
      nat_gateway_id = null
    }
  }
}
