 provider "aws" {
  access_key  = "${var.aws_access_key_id}"
  secret_key  = "${var.aws_secret_access_key}"
  region      = "us-east-2"
}


  resource "aws_instance" "ansible" {
               ami = "ami-0520e698dd500b1d1"
               instance_type = "t2.micro"
               security_groups = ["launch-wizard-1"]
               key_name = "krishna321"

connection {
               type = "ssh"
               user = "ec2-user"
               host = aws_instance.ansible.public_ip
               private_key = "${file("./krishna321.pem")}"
               }

provisioner "local-exec" {
               command = "echo ${aws_instance.ansible.public_ip} >> public_ip.txt"
               }
provisioner "remote-exec" {
               inline = [ "sudo yum update",
                          "yum install python3 -y",
                          "alternatives --set python /usr/bin/python3",
                          "yum -y install python3-pip",
                          "useradd krishna",
                          "passwd krishna",]                          ]
                 }

           }
