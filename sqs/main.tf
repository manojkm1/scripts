resource "aws_sqs_queue" "prod_queue" {
  name                      = "prod-queue"
  delay_seconds             = 70
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10


  tags = {
    Environment = "production"
  }
}