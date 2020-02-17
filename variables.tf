# main creds for AWS connection
variable "aws_access_key_id" {
  default = "AWS access key"
}
variable "aws_secret_access_key" {
  default = "AWS secret access key"
}
 }
variable "inst_ami" {
  default = "Amazon Machine Image for the Instance"
}
variable "inst_type" {
  default = "type of instances to provision"
}

variable "vpc_region" {
  default = "VPC region"
}


