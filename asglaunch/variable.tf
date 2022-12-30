variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "ami_id" {
    type = string
    default = "ami-0b5eea76982371e91"
}


variable "aws-region" {
  default = "ap-south-1a"
}

variable "max_size" {
  type = number
  default = "1"
}
variable "min_size" {
  type = number
  default = "1"
}
variable "desired_capacity" {
  type = number
  default = "1"
}