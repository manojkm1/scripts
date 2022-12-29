resource "aws_iam_role" "s3_role" {
  name = "s3"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "s3.amazonaws.com"
        }
      },
    ]
  })

}


resource "aws_iam_instance_profile" "s3-iam" {
    name = "s3-iam"
    role = aws_iam_role.s3_role.name
}

resource "aws_instance" "s3-iam" {
  ami           = var.ami_id
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.s3-iam.name
  tags = {
    Name = "s3-iam"
  }
}