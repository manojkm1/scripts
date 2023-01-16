resource "aws_db_instance" "encrypt" {
 identifier = "encryption-rest"
  allocated_storage    = 10
  db_name              = "manojdb"
  engine               = "mysql"
  #engine_version       = "8.30"
  instance_class       = "db.t3.micro"
  username             = "manoj"
  password             = "admin1234"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true

  multi_az = false 
  backup_retention_period = 10
  auto_minor_version_upgrade = true

  storage_encrypted = true
}