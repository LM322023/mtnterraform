#Block-3: Resource Block using just the regular values
/*resource "aws_instance" "test_ec2" {
  ami           = var.ami_id #ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230516
  instance_type = var.instance_type
  user_data     = file("${path.module}/httpd.sh")
  tags = {
    Name = var.name
    Env  = var.environment
  }
}

#Block-3: Resource Block using list of string and our selection is 1
resource "aws_instance" "test_ec2" {
  ami           = var.ami_id 
  instance_type = var.instance_type[1]
  user_data     = file("${path.module}/httpd.sh")
  tags = {
    Name = var.name
    Env  = var.environment
  }
}

#Block-3: Resource Block using map and our selection is stg
resource "aws_instance" "test_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type["stg"]
  user_data     = file("${path.module}/httpd.sh")
  tags = {
    Name = var.name
    Env  = var.environment
  }
}
*/
#Block-3: Resource Block using map and our selection and data source for a Red Hat image
resource "aws_instance" "test_ec2" {
  ami           = data.aws_ami.rhel.id
  instance_type = var.instance_type["stg"]
  #user_data     = file("${path.module}/httpd.sh")
  user_data = file("${path.module}/app1-install.sh")
  tags = {
    Name = var.name
    Env  = var.environment
  }
}

resource "aws_eip" "my_eip" {
  instance = aws_instance.test_ec2.id
}