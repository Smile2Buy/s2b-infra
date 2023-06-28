locals {
  network = {
    vpc = {
      cidr_block = "10.0.0.0/16"

      subnets = [
        {
          availability_zone  = "ap-northeast-2a"
          public_cidr_block  = "10.0.101.0/16"
          private_cidr_block = "10.0.1.0/16"
        }
      ]
    }
  }
}
