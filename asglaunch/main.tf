resource "aws_launch_template" "asg-launch" {
  name_prefix   = "asg-lt"
  image_id      = var.ami_id
  instance_type = var.instance_type
}

resource "aws_autoscaling_group" "asg" {
  name = "asg-launch"
  availability_zones = ["us-east-1a","us-east-1b"]
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size

  launch_template {
    id      = aws_launch_template.asg-launch.id
    version = "$Latest"
  }
}