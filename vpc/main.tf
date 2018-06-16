resource "aws_vpc" "main" {
    cidr_block             = "${var.cidr_block}"
    instance_tenancy       = "${var.tenancy}"
}

tags {
    Name = "${var.vpc_name}-VPC"
}