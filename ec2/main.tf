resource "aws_instance" "ec2" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"

  vpc_security_group_ids = ["${split(",", var.vpc_security_group_ids)}"]
  key_name               = "${var.key_name}"
  subnet_id              = "${var.subnet_id}"
  iam_instance_profile   = "${var.iam_instance_profile}"

  # user_data              = "${file("customScript/${var.userdatascript}")}"

  tags {
    Name = "${var.name}"
  }
}
