resource "aws_lb" "ALB-1" {
  name               = "ALB-1"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
    subnets = var.subnet_id

  enable_deletion_protection = false

  tags = {
    Environment = "Alb"
  }
}