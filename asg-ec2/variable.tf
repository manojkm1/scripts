variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "ami_id" {
    type = string
    default = "ami-0b5eea76982371e91"
}


variable "availability_zones" {
  default = ["us-east-1a","us-east-1b"]
}

variable "security_groups" {
    default = ["sg-039bb450c7621c290","sg-03f74afcb38466d78"]
  
}

variable "asg_vpc_zone_identifier" {
  default = ["subnet-011f698d4be6311ac", "subnet-06da87741c7d8db5a"]
}

variable "max_size" {
  default = 5
}

variable "min_size" {
  default = 1
}

variable "desired_capacity" {
  default = 2
}

variable "health_check_grace_period" {
  default = 300
}