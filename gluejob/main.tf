resource "aws_iam_role" "glue-role" {
  name = "glue-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "glue.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


resource "aws_s3_bucket" "glue15464" {
  bucket = "glue15464"
  acl    = "private"

  versioning {
    enabled = false
  }
}



resource "aws_glue_job" "glue-job" {
  name     = "gluejob"
  role_arn = aws_iam_role.glue-role.arn

  command {
    script_location = "s3://${aws_s3_bucket.glue15464.bucket}/example.scala"
  }

  default_arguments = {
    "--job-language" = "scala"
  }
}

