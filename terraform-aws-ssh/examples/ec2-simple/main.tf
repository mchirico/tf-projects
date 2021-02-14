terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}



resource "aws_instance" "public-ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = "rommel"
  vpc_security_group_ids      = [aws_security_group.ec2-sg.id]
  associate_public_ip_address = true

  user_data = <<EOF
#!/bin/sh
sudo apt-get update
sudo apt-get install -y nginx
sudo apt-get install -y net-tools
sudo service nginx start
EOF


  tags = {
    Name = "ec2-nginx"
  }

}


resource "aws_security_group" "ec2-sg" {
  name        = "security-group-terraform"
  description = "allow select inbound access to the Application"


  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["100.14.26.43/32"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
