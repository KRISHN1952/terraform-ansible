# main creds for AWS connection
variable "aws_access_key_id" {
  description = "AKIAUHGSF3INKPVQC4SI"
}

variable "aws_secret_access_key" {
  description = "FxXrLgLUj5uggjL6zUnFCfrNGmZAF/bRGwxz6+an"
}

variable "availability_zone" {
  description = "availability zone used for the demo, based on AWS region"
  default = {
    us-east-1 = "us-east-1a"
  }
}

# this is a keyName for key pairs
variable "aws_key_name" {
  description = "krishna1.pem"
}

variable "inst_ami" {
  description = "ami-0520e698dd500b1d1"
}

variable "inst_type" {
  description = "t2.micro"
}

variable "vpc_public_sg_id" {
  description = "sg-077e143ceb5d7a64f"
}

variable "vpc_public_sn_id" {
  description = "subnet-6518ed0e"
}

variable "vpc_region" {
  description = "US East (Ohio)"
}

variable "public_ssh_key" {
  description = "ssh -i "cg1.pem" ec2-user@ec2-13-58-62-189.us-east-2.compute.amazonaws.com"
}
