resource "aws_vpc" "vpc-sb2-ap-northeast-2" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "VPC: s2b-ap-northeast-2"
  }
}