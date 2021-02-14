variable "whitelist_ip" {
  default = "100.14.26.43/32"
}

variable "public_access_ip_range" {
  default = "0.0.0.0/0"
}

variable "ssh_key_name" {
  default = "rommel-rsa"
}


variable "aws_region" {
  default = "us-east-1"
}


variable "ec2_count" {
  default = "1"
}

variable "ami_id" {
  default = "ami-03d315ad33b9d49c4"
}

variable "instance_type" {
  default = "t2.micro"
}
