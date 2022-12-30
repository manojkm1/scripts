resource "aws_launch_configuration" "ec2-launch" {
  name_prefix     = "ec2-launch"
  image_id        = var.ami_id
  instance_type   = var.instance_type
  security_groups = var.security_groups
}

resource "aws_autoscaling_group" "ec2-asg" {
  name                      = "ec2-asg"
  vpc_zone_identifier       = var.asg_vpc_zone_identifier
  launch_configuration      = aws_launch_configuration.ec2-launch.name
  max_size                  = var.max_size
  min_size                  = var.min_size
  desired_capacity          = var.desired_capacity
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = "EC2"
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "ec2"
    propagate_at_launch = true
  }
}

resource "aws_elb" "elb" {
  name               = "elb"
  availability_zones = var.availability_zones

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }
}

resource "aws_autoscaling_attachment" "asg_attachment_my-elb" {
  autoscaling_group_name = aws_autoscaling_group.ec2-asg.id
  elb                    = aws_elb.elb.id
}
resource "aws_instance" "my-ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
}

resource "aws_elb_attachment" "my-ec2" {
  elb      = aws_elb.elb.id
  instance = aws_instance.my-ec2.id
}