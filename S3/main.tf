resource "aws_s3_bucket" "b" {
  bucket = "manoj15264"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "s3-acl" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}

resource "aws_iam_user" "manu" {
  name = "manoj"
  
}

resource "aws_iam_policy" "s3policy" {
  name        = "s3-policy"
  description = "my-policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "s3-attach" {
  user       = aws_iam_user.manu.name
  policy_arn = aws_iam_policy.s3policy.arn
}