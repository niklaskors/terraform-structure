data "aws_availability_zones" "all" {}

resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "${var.environment_prefix}-main"
  }
}

module "public_subnet" {
  source             = "../public-subnet"
  name               = "public"
  environment_prefix = "${var.environment_prefix}"
  vpc_id             = "${aws_vpc.main.id}"
  availability_zone  = "${data.aws_availability_zones.all.names[0]}"
  gateway_id         = "${aws_internet_gateway.main.id}"
}

module "private_subnet" {
  source             = "../private-subnet"
  name               = "private"
  environment_prefix = "${var.environment_prefix}"
  vpc_id             = "${aws_vpc.main.id}"
  availability_zone  = "${data.aws_availability_zones.all.names[1]}"
}
