module "us-east-1" {
  source             = "../../region"
  environment_prefix = "${var.environment_prefix}"
  region             = "us-east-1"
  base_cidr_block    = "${var.us_east_1_base_cidr_block}"
  default_ami        = "ami-b70554c8"
}

module "eu-west-1" {
  source             = "../../region"
  environment_prefix = "${var.environment_prefix}"
  region             = "eu-west-1"
  base_cidr_block    = "${var.eu_west_1_base_cidr_block}"
  default_ami        = "ami-466768ac"
}
