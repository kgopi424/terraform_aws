provider "aws" {
  region     = "us-east-1"
  profile    = "default"
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}
resource "aws_instance" "PrivateInstance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name 
  subnet_id     = var.private_subnet_id
  associate_public_ip_address = false
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
