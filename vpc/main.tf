resource "aws_vpc" "main" {
    cidr_block             = "${var.cidr_block}"
    instance_tenancy       = "${var.tenancy}"

    tags {
        Name = "${var.vpc_name}-VPC"
    }
}
resource "aws_subnet" "main" {
    vpc_id = "${aws_vpc.main.id}"
    count = "${length((split(",", lookup(var.availability_zone, var.region))))}"
    cidr_block = "${cidrsubnet(var.cidr_block, 8, count.index)}"
    availability_zone = "${element(split(",", lookup(var.availability_zone, var.region)), count.index)}"
    
    tags {
        Name = "${element(split(",",lookup(var.availability_zone, var.region)), count.index)}"
    }
}
resource "aws_internet_gateway" "igw" {
    vpc_id = "${aws_vpc.main.id}"
    tags {
        Name = "${var.igw_name}-igw"
    }
}

resource "aws_route_table" "public_route" {
    vpc_id = "${aws_vpc.main.id}"

    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw.id}"
    }
    tags {
        Name = "Public Subnet Route"
    }
}

resource "aws_route_table_association" "public_rt_ass" {
    count = "${var.subnet-count}"
    subnet_id = "${element((aws_subnet.main.*.id), count.index)}"
    route_table_id = "${aws_route_table.public_route.id}"
}

