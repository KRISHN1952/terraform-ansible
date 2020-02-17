# main creds for AWS connection
variable "aws_access_key_id" {
  default = "AWS access key"
}

variable "aws_secret_access_key" {
  default = "AWS secret access key"
}

variable "availability_zone" {
  description = "availability zone used for the demo, based on AWS region"
  default = {
    us-east-1 = "us-east-1a"
  }
}

# this is a keyName for key pairs
variable "aws_key_name" {
  default = "Key Pair Name used to provision to the box"
}

variable "inst_ami" {
  default = "Amazon Machine Image for the Instance"
}

variable "inst_type" {
  default = "type of instances to provision"
}

variable "vpc_public_sg_id" {
  default = "VPC public security group"
}

variable "vpc_public_sn_id" {
  default = "VPC public subnet"
}

variable "vpc_region" {
  default = "VPC region"
}

variable "public_ssh_key" {
  default = "Public SSH key value"
}
