variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "ec2_security_group_id" {
  type = string
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "iam_instance_profile" {
  type = string
}
