resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "myvpc"
  }
}

resource "aws_vpc_endpoint" "dyanamodb" {
  vpc_id       = aws_vpc.vpc.id
  service_name = "com.amazonaws.us-east-1.dynamodb"

  tags = {
    Environment = "dev"
  }
}