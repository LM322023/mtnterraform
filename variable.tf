#Block-4: Input Variables Block
variable "region" {
  default     =  "us-west-2"
  description = "Region where the ec2 is launched"
  type        = string
}

variable "ami_id" {
  default     = "ami-03f65b8614a860c29"
  description = "This is the AMI in use"
  type        = string
}

variable "instance_type" {
  default     = "t2.micro"
  description = "EC2 Instance Type"
  type        = string
}

variable "name" {
  default     = "SL_terraform"
  description = "Ec2 instance name"
  type        = string
}

variable "environment" {
  default     = "prod"
  description = "Ec2 instance environment"
  type        = string
}