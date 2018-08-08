output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "primary_subnet_id" {
  value = "${module.primary_subnet.subnet_id}"
}

output "secondary_subnet_id" {
  value = "${module.secondary_subnet.subnet_id}"
}

output "ssh_security_group_id" {
  value = "${aws_security_group.ssh.id}"
}

output "default_security_group_id" {
  value = "${aws_default_security_group.default.id}"
}
