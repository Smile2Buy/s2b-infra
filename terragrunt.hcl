generate "terraform" {
  path      = "terraform.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  cloud {
    organization = "smile2buy"
    workspaces {
      name = "arch-v1"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}
EOF
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "ap-northeast-2"
}
EOF
}