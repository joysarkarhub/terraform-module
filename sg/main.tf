resource "aws_security_group" "main" {
    name = "${var.sg_name}"
    vpc_id = "${var.aws_vpc}"
}