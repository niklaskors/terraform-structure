resource "aws_instance" "skyhawk_website" {
  ami                    = "${var.ami}"
  instance_type          = "t2.micro"
  monitoring             = "false"
  subnet_id              = "${var.subnet_id}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.security_groups}"]

  tags {
    Name = "${var.environment_prefix}-skyhawk-website"
  }

  lifecycle {
    create_before_destroy = true
  }
}
