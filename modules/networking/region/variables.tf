variable "region" {
  description = "The name of the AWS region to set up a network within"
}

variable "base_cidr_block" {}

variable "region_numbers" {
  default = {
    us-east-1 = 1
    us-west-1 = 2
    us-west-2 = 3
    eu-west-1 = 4
  }
}
