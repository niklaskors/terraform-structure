module "us-east-1" {
  source             = "../modules/networking/region"
  environment_prefix = "${var.environment_prefix}"
  region             = "us-east-1"
  base_cidr_block    = "${var.base_cidr_block}"
}

module "skyhawk-website" {
  source             = "../modules/services/skyhawk-website"
  environment_prefix = "${var.environment_prefix}"
  subnet_id          = "${module.us-east-1.public_subnet_id}"
  key_name           = "${var.main_ssh_key_name}"
  security_groups    = "${list("${module.us-east-1.default_security_group_id}", "${module.us-east-1.ssh_security_group_id}")}"
}
