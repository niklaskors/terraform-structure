resource "aws_key_pair" "main_key" {
  key_name   = "${var.environment_prefix}-main-key"
  public_key = "${file("key.pub")}"
}
