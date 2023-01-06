resource "aws_efs_file_system" "efs" {
  creation_token = "my-efs"

  tags = {
    Name = "EFS"
  }
}


resource "aws_instance" "ec2" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [var.security_groups]
  subnet_id       = var.subnet_id
  availability_zone = var.availability_zones
  
  tags = {
    Name = "efs"
  }
}

resource "aws_efs_mount_target" "mount" {
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = var.subnet_id
  security_groups = [var.security_groups]
}  