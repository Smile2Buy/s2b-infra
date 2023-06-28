terraform {
  required_version = var.versions.terraform

  required_providers {
    aws = {
      source  = var.sources.aws
      version = var.versions.aws
    }
  }
}