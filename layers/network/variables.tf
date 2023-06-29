variable "organization" {
  type        = string
  description = "organization name"
}

variable "environment" {
  type        = string
  description = "environment of CI/CD pipeline"
}

variable "config" {
  type = object({
    vpc = object({
      cidr_block = string
      subnets    = list(
        object({
          availability_zone  = string
          public_cidr_block  = string
          private_cidr_block = string
        })
      )
    })
  })
  description = "configs for network-layer"
}