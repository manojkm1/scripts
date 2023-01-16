
resource "aws_route53_zone" "manoj" {
  name = "prod.com"

  tags = {
    Environment = "prod"
  }
}