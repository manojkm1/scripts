resource "aws_lb" "NLB-1" {
  name               = "NLB-1"
  internal           = false
  load_balancer_type = "network"
  subnets = var.subnet_id

  enable_deletion_protection = false

  tags = {
    Environment = "Nlb"
  }
}