variable "db_name" {
  type = string
  default = "mydb"
}

variable "engine" {
  type = string
  default = "mysql"
}

variable "engine_version" {
  type = string
  default = "5.7"
}

variable "instance_class" {
  type = string
  default = "db.t3.micro"
}

variable "username" {
  type = string
  default = "manu"
}

variable "password" {
  type = string
  default = "manoj11111111"
}

variable "parameter_group_name" {
  type =string
  default = "default.mysql5.7"
}

variable "allocated_storage" {
  type =number
  default =10
}

variable "max_allocated_storage" {
  type = number
  default = 20
}