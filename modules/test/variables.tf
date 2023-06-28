variable "sources" {
  type        = map(string)
  description = "source of stuff"
  default     = {
    aws = "hashicorp/aws"
  }
}

variable "versions" {
  type        = map(string)
  description = "version of stuff"
  default     = {
    aws       = ">= 4.47"
    terraform = ">= 1.0"
    vpc       = "~> 5.0"
  }
}