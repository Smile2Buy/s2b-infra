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
}