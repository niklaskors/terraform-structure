variable "region" {}

variable "region_numbers" {
  default = {
    us-east-1 = 1
    us-west-1 = 2
    us-west-2 = 3
    eu-west-1 = 4
  }
}

variable "base_cidr_block" {}

variable "environment_prefix" {}
