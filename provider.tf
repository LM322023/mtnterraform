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
