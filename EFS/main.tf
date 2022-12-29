resource "aws_efs_file_system" "efs" {
  creation_token = "my-efs"

  tags = {
    Name = "EFS"
  }
}