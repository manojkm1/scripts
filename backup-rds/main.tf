
provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "us-west-2"
  alias  = "replica"
}

resource "aws_db_instance" "mydb" {
  allocated_storage       = 10
  identifier              = "mydb"
  engine                  = "postgres"
  engine_version          = "13.4"
  instance_class          = "db.t3.micro"
  name                    = "mydb"
  username                = "masterusername"
  password                = "mustbeeightcharacters"
  backup_retention_period = 7
  storage_encrypted       = true
  skip_final_snapshot     = true
}

resource "aws_kms_key" "key" {
  description = "Encryption key for automated backups"

  provider = "aws.replica"
}

resource "aws_db_instance_automated_backups_replication" "default" {
  source_db_instance_arn = aws_db_instance.mydb.arn
  kms_key_id             = aws_kms_key.key.arn

  provider = "aws.replica"
}