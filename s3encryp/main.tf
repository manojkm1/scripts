resource "aws_kms_key" "new-key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 15
}

resource "aws_s3_bucket" "s3-encrypt" {
  bucket = "manoj-encrypt"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.s3-encrypt.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.new-key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}