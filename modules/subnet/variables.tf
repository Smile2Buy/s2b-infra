variable "vpc_id" {
  type        = string
  description = "Id of VPC that would be located in"
}

variable "subnet_config" {
  type = object({
    name              = string
    cidr_block        = string
    availability_zone = string
    tags              = map(string)
  })
  description = "Subnet configs that is compatible with public/private"
}

variable "route_table_config" {
  type = object({
    name  = string
    route = object({
      cidr_block     = string
      gateway_id     = string
      nat_gateway_id = string
    })
  })
  description = "Route-table configs for subnet"
}
