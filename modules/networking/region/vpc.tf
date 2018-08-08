resource "aws_vpc" "main" {
  enable_dns_support   = true
  enable_dns_hostnames = true
  cidr_block           = "${cidrsubnet(var.base_cidr_block, 4, lookup(var.region_numbers, var.region))}"
}
