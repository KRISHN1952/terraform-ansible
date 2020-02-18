 provider "aws" {
  access_key  = "${var.aws_access_key_id}"
  secret_key  = "${var.aws_secret_access_key}"
  region      = "us-east-2"
}


resource "aws_instance" "ansible" {
               ami = "ami-0520e698dd500b1d1"
               instance_type = "t2.micro"
               key_name = "krishna"
               security_groups = ["sg-0f51a292dbe8004ad"]
 
 
              connection {
               type = "ssh"
               user = "root"
               host = "${aws_instance.ansible.public_ip}"
               private_key = "${file("/home/ec2-user/.ssh)}"

              provisioner "remote-exec" {
               inline = [ "sudo yum -y update",
                           "sudo yum -y install epel-repo",
                            "sudo yum -y install ansible",]
             }
           }
         }
~
