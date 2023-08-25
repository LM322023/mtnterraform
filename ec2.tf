provider "aws" {
  region = "us-west-2"
  profile = "default"
}

resource "aws_instance" "ec2" {
  ami           = "ami-03f65b8614a860c29"
  instance_type = "t2.micro"
  tags = {
    Name = "SL_terraform"
    env = "prod"
  }
}