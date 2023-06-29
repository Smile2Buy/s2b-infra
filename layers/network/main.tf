locals {
  tag_name_prefix = "${var.organization}-${var.environment}"
  vpc_name        = local.tag_name_prefix
}

// 1-and-only enveloping vpc
resource "aws_vpc" "main" {
  cidr_block           = var.config.vpc.cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = local.vpc_name
  }
}

// <--- Section for public subnet
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
// >--- Section for public subnet

// <--- Section for private subnet
resource "aws_eip" "main" {
  for_each = {for index, subnet in var.config.vpc.subnets : index => subnet}

  tags = {
    Name = "${local.tag_name_prefix}-eip-${each.value.availability_zone}"
  }
}

resource "aws_nat_gateway" "main" {
  for_each = {for index, subnet in var.config.vpc.subnets : index => subnet}

  allocation_id = aws_eip.main[each.key].id
  subnet_id     = module.public_subnet[each.key].id # using output of module

  depends_on = [aws_internet_gateway.main]

  tags = {
    Name = "${local.tag_name_prefix}-ng-${each.value.availability_zone}"
  }
}

module "private_subnet" {
  source = "../../modules/subnet"

  for_each = {for index, subnet in var.config.vpc.subnets : index => subnet}

  vpc_id        = aws_vpc.main.id
  subnet_config = {
    name              = "${local.tag_name_prefix}-private-${each.value.availability_zone}"
    cidr_block        = each.value.private_cidr_block
    availability_zone = each.value.availability_zone
    tags              = {}
  }
  route_table_config = {
    name  = "${local.tag_name_prefix}-private"
    route = {
      cidr_block     = "0.0.0.0/0"
      gateway_id     = null
      nat_gateway_id = aws_nat_gateway.main[each.key].id
    }
  }
}
// >--- Section for private subnet
