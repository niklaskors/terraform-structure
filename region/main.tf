provider "aws" {
  region = "${var.region}"
}

module "ssh" {
  source             = "../modules/ssh"
  environment_prefix = "${var.environment_prefix}"
}

module "network" {
  source             = "../modules/networking/region"
  environment_prefix = "${var.environment_prefix}"
  region             = "${var.region}"
  base_cidr_block    = "${var.base_cidr_block}"
}

module "skyhawk-website" {
  source             = "../modules/services/skyhawk-website"
  environment_prefix = "${var.environment_prefix}"
  subnet_id          = "${module.network.public_subnet_id}"
  key_name           = "${module.ssh.key_name}"
  ami                = "${var.default_ami}"
  security_groups    = "${list("${module.network.default_security_group_id}", "${module.network.ssh_security_group_id}")}"
}
