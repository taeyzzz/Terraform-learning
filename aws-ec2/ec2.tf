terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "ap-southeast-1"
}

resource "aws_instance" "ubuntu_server" {
  ami           = "ami-055d15d9cfddf7bd3"
  instance_type = "t2.micro"
  key_name      = "taey-ag-laptop"

  vpc_security_group_ids = ["${aws_security_group.ingress_web_server.id}"]

  tags = {
    Name = var.instance_name_tag
  }
}