resource "aws_subnet" "main" {
  cidr_block              = "${cidrsubnet(data.aws_vpc.target.cidr_block, 4, lookup(var.az_numbers, data.aws_availability_zone.target.name_suffix))}"
  vpc_id                  = "${var.vpc_id}"
  availability_zone       = "${var.availability_zone}"
  map_public_ip_on_launch = true

  # assign_ipv6_address_on_creation = true
  tags {
    Name = "${var.environment_prefix}-${var.name}"
  }
}

resource "aws_route_table" "main" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${var.gateway_id}"
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = "${var.gateway_id}"
  }

  tags {
    Name = "${var.environment_prefix}-main"
  }
}

resource "aws_route_table_association" "main" {
  subnet_id      = "${aws_subnet.main.id}"
  route_table_id = "${aws_route_table.main.id}"
}
