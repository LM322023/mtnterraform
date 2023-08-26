#Block-4: Input Variables Block
variable "region" {
  description = "Region where the ec2 is launched"
  type        = string
}

/*variable "ami_id" {
  #default     = "ami-03f65b8614a860c29"    #Ubuntu
  #default     = "ami-002829755fa238bfa"    #Aml 2023
  #default     = "ami-00aa0673b34e3c150" #Rhel
  description = "This is the AMI in use"
  type        = string
}

variable "instance_type" {
  #default     = "t2.micro"
  default     = "t2.medium"
  description = "EC2 Instance Type slectected from a string only"
  type        = string
}

variable "instance_type" {
  default     = ["t2.micro", "t2.medium","t3.medium"]
  description = "EC2 Instance Type selected from a list of string"
  type        = list(string)
}
*/
variable "instance_type" {
  default = {
    dev  = "t2.micro"
    stg  = "t2.medium"
    prod = "t3.micro"
  }
  description = "EC2 Instance Type selected from map"
  type        = map(any)
}
variable "name" {
  description = "Ec2 instance name"
  type        = string
}

variable "environment" {
  description = "Ec2 instance environment"
  type        = string
}

# variable "boolean" {
#   #  default     = "false"
#   description = "Boolean used"
#   type        = bool
# }