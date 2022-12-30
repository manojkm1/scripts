variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "ami_id" {
    type = string
    default = "ami-0b5eea76982371e91"
}

variable "security_groups" {
    default = ["sg-039bb450c7621c290","sg-03f74afcb38466d78"]
  
}

variable "asg_min_size" {
  default = 1
}

variable "asg_max_size" {
  default = 3
}

variable "asg_desired_capacity" {
  default = 2
}

variable "health_check_grace_period" {
  default = 300
}
