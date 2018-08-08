resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = "${aws_eip.nat_gateway_ip.id}"
  subnet_id     = "${module.public_subnet.subnet_id}"

  tags {
    Name = "${var.environment_prefix}-nat-gateway"
  }
}

resource "aws_eip" "nat_gateway_ip" {
  vpc = true

  tags {
    Name = "${var.environment_prefix}-nat-gateway-ip"
  }
}
