resource "aws_lb" "NLB-1" {
  name               = "NLB-1"
  internal           = false
  load_balancer_type = "network"
  subnets            = var.subnet_id

  enable_deletion_protection = false

  tags = {
    Environment = "Nlb"
  }
}

resource "aws_lb_target_group" "NLB-tg" {
  name     = "nlb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_instance" "ec2-1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  
  
  tags = {
    Name = "ec2-1"
  }
}


resource "aws_lb_listener" "nlb-ls" {
  load_balancer_arn = aws_lb.NLB-1.arn
  port              = "443"
  protocol          = "TLS"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.NLB-tg.arn
  }
}


resource "aws_lb_target_group_attachment" "tg-attach" {
  target_group_arn = aws_lb_target_group.NLB-tg.arn
  target_id        = aws_instance.ec2-1.id
  port             = 80
  
}