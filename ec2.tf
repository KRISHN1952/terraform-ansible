 provider "aws" {
  access_key  = "${var.aws_access_key_id}"
  secret_key  = "${var.aws_secret_access_key}"
  region      = "us-east-2"
}
resource "aws_key_pair" "poc-1" {

  key_name   = "poc-3"
  public_key = "${var.my_public_key}"
}

 data "template_file" "init" {
  template = "${file("${path.module}/userdata.tpl")}"
}

 resource "aws_instance" "ansible" {
               ami = "ami-0520e698dd500b1d1"
               instance_type = "t2.micro"
               security_groups = ["launch-wizard-1"]
               user_data = "${data.template_file.init.rendered}"
               key_name = "${aws_key_pair.poc-1.id}"
           }
