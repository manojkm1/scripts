variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "ami_id" {
    type = string
    default = "ami-0b5eea76982371e91"
}

variable "availability_zones" {
  default = "us-east-1a"
}

variable "security_groups" {
  type    = string
  default = "sg-039bb450c7621c290"
}

variable "subnet_id" {
  type    = string
  default = "subnet-08270319d5a4aae95"
}