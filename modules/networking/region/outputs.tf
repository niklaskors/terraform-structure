output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "public_subnet_id" {
  value = "${module.public_subnet.subnet_id}"
}

output "private_subnet_id" {
  value = "${module.private_subnet.subnet_id}"
}

output "ssh_security_group_id" {
  value = "${aws_security_group.ssh.id}"
}

output "default_security_group_id" {
  value = "${aws_default_security_group.default.id}"
}
