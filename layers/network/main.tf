locals {
  tag_name_prefix = "${var.organization}-${var.environment}"
  vpc_name        = local.tag_name_prefix
}