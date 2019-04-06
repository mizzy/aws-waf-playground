variable "ami" {
  default = "ami-cbb259b4"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  type = "string"
}

variable "security_groups" {
  type = "list"
}

variable "subnets" {
  type = "list"
}

variable "vpc_id" {
  type = "string"
}
