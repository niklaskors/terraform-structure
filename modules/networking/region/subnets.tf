data "aws_availability_zones" "all" {}

resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"
}

module "primary_subnet" {
  source            = "../public-subnet"
  vpc_id            = "${aws_vpc.main.id}"
  availability_zone = "${data.aws_availability_zones.all.names[0]}"
  gateway_id        = "${aws_internet_gateway.main.id}"
}

module "secondary_subnet" {
  source            = "../private-subnet"
  vpc_id            = "${aws_vpc.main.id}"
  availability_zone = "${data.aws_availability_zones.all.names[1]}"
}
