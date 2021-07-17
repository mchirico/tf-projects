
variable "aws_region" {
    default = "us-east-1"
}


variable "ec2_count" {
  default = "1"
}

variable "ami_id" {
    // Amazon Linux 2
    default = "ami-0dc2d3e4c0f9ebd18"
}

variable "instance_type" {
  default = "t2.micro"
}

// variable "subnet_id" {}

