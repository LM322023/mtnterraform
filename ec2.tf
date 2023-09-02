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
  subnet_id = aws_subnet.main.id

  depends_on = [ aws_vpc.my_test ]
  tags = {
    Name = var.name
    Env  = var.environment
  }
}
# #EIP configuration
# resource "aws_eip" "my_eip" {
#   instance = aws_instance.test_ec2.id
# }

#Implicit dependency is when terraform will determine the 1st thing to be created before creating another resource using the depend_on meta argument
#Explicit dependency is you determine which resource should be created 1st like below example

resource "aws_vpc" "my_test" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "demo_vpc"
  }
}
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.my_test.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}