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