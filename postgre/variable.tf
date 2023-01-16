variable "identifier" {
  default = "postgresql"
}

variable "allocated_storage" {
  default = 10
}

variable "storage_type" {
 default = "gp2" 
}

variable "engine" {
  default = "postgres"
}

variable "engine_version" {
  default = 13.7
}

variable "instance_class" {
  default = "db.t3.micro"
}

variable "name" {
  default = "db_manoj"
}

variable "username" {
 default =  "manoj"
}

variable "password" {
  default = "admin12345"
}

variable "parameter_group_name" {
  default = "default.postgres13"
}

variable "subnet1" {
  default = "subnet-011f698d4be6311ac"
}

variable "subnet2" {
  default = "subnet-06da87741c7d8db5a"
}