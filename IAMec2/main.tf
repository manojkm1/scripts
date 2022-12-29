resource "aws_iam_role" "ec2_role" {
  name = "ec2"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

}

resource "aws_iam_instance_profile" "ec2-IAM" {
  name = "ec2-IAM"
  role = aws_iam_role.ec2_role.name
}


resource "aws_instance" "ec2-iam" {
  ami           = var.ami_id
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2-IAM.name
  tags = {
    Name = "ec2-iam"
  }
}