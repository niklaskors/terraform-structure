resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = "${aws_eip.nat_gateway_ip.id}"
  subnet_id     = "${module.primary_subnet.subnet_id}"
}

resource "aws_eip" "nat_gateway_ip" {
  vpc = true
}
