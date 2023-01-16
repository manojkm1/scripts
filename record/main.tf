resource "aws_route53_zone" "manoj" {
  name = "dev.com"

  tags = {
    Environment = "dev"
  }
}

resource "aws_route53_record" "dev" {
  zone_id = aws_route53_zone.manoj.zone_id
  name    = "www"
  type    = "CNAME"
  ttl     = 30
  records = ["dev.com"]
}