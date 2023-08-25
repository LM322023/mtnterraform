#Block-1: Terraform Settings Block
terraform {
  required_version = "~> 1.0" #1.1.4/5/6/7   1.2/3/4/5 1.1.4/5/6/7 will still work
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}

#Block-2: Provider Block
provider "aws" {
  region  = var.region
  profile = "default"
}

#Block-3: Resource Block
resource "aws_instance" "ec2" {
  ami           = var.ami_id #ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230516
  instance_type = var.instance_type
  tags = {
    Name = var.name
    Env  = var.environment
  }
}