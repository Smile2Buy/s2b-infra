output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = values(module.public_subnet)[*].id
}

output "private_subnet_ids" {
  value = values(module.private_subnet)[*].id
}
