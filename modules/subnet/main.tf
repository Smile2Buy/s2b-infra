resource "aws_subnet" "main" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_config.cidr_block
  availability_zone = var.subnet_config.availability_zone

  tags = merge(
    {
      Name = var.subnet_config.name
    },
    var.subnet_config.tags
  )
}

resource "aws_route_table" "main" {
  vpc_id = var.vpc_id

  dynamic "route" {
    for_each = var.route_table_config.route != null ? [true] : []

    content {
      cidr_block     = var.route_table_config.route.cidr_block
      gateway_id     = var.route_table_config.route.gateway_id
      nat_gateway_id = var.route_table_config.route.nat_gateway_id
    }
  }

  tags = {
    Name = var.route_table_config.name
  }
}

resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}
