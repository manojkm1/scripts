variable "identifier" {
  default = "snapshot"
}

variable "allocated_storage" {
  default = 10
}

variable "engine" {
  default = "mysql"
}

variable "engine_version" {
  default = "8.0.30"
}

variable "instance_class" {
  default = "db.t3.micro"
}

variable "name" {
  default = "mydb"
}

variable "username" {
 default =  "manoj"
}

variable "password" {
  default = "admin1234"
}

variable "parameter_group_name" {
  default = "default.mysql8.0"
}

variable "backup_retention_period" {
  default  = 0
}

variable "maintenance_window" {
  default = "Thu:09:00-Thu:09:30"
}