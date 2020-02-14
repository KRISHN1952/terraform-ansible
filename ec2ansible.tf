# Setup our aws provider
provider "aws" {
  access_key  = "${var.aws_access_key_id}"
  secret_key  = "${var.aws_secret_access_key}"
  region      = "${var.vpc_region}"
}

# instances
resource "aws_instance" "ec2Instances" {
  count = 1
  ami = "${var.inst_ami}"
  instance_type = "${var.inst_type}"
  subnet_id = "${var.vpc_public_sn_id}"
  associate_public_ip_address = true
  source_dest_check = false

  security_groups = [
    "${var.vpc_public_sg_id}"]

  tags = {
    Name = "ec2Instances${count.index}"
  }
}
  connection {
    type     = "ssh"
    user     = "root"
    password = "${var.root_password}"
    host     = "${var.host}"
  }
  provisioner "remote-exec" {
    inline = [
       "sudo yum install ansible"
    ]
    }
