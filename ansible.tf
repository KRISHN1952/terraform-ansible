 provider "aws" {
  access_key  = "AKIAUHGSF3INKD77UGFJ"
  secret_key  = "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"
  region      = "us-east-2"
}


resource "aws_instance" "ansible" {
               ami = "ami-0520e698dd500b1d1"
               instance_type = "t2.micro"
               key_name = "krishna"
               security_groups = ["sshonly"]
 
 
              connection {
               type = "ssh"
               user = "ec2-user"
               host = "${aws_instance.ansible.public_ip}"
               private_key = "${file("/home/ec2-user/.ssh)}"

              provisioner "remote-exec" {
               inline = [ "sudo dnf install python3 python3-pip -y",
                           "pip3 install ansible --user", ]
             }
           }
         }
~
