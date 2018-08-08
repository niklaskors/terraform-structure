provider "aws" {
  region = "us-east-1"
}

module "global" {
  source = "global"
}

module "prod" {
  source             = "prod"
  environment_prefix = "prod"
  base_cidr_block    = "${var.prod_base_cidr_block}"
  main_ssh_key_name  = "${module.global.main_ssh_key_name}"
}

module "stage" {
  source             = "stage"
  environment_prefix = "stage"
  base_cidr_block    = "${var.stage_base_cidr_block}"
  main_ssh_key_name  = "${module.global.main_ssh_key_name}"
}
