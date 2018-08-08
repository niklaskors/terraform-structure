resource "aws_default_security_group" "default" {
  vpc_id = "${aws_vpc.main.id}"

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  tags {
    Name = "${var.environment_prefix}-default"
  }
}

resource "aws_security_group" "region" {
  name        = "region"
  description = "Open access within this region"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["${aws_vpc.main.cidr_block}"]
  }

  tags {
    Name = "${var.environment_prefix}-region"
  }
}

resource "aws_security_group" "internal-all" {
  name        = "internal-all"
  description = "Open access within the full internal network"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["${var.base_cidr_block}"]
  }

  tags {
    Name = "${var.environment_prefix}-internal-all"
  }
}

resource "aws_security_group" "ssh" {
  name        = "ssh"
  description = "Allow ssh sessions"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = 6
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags {
    Name = "${var.environment_prefix}-ssh"
  }
}
