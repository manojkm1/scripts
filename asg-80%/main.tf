resource "aws_launch_configuration" "ec2-launch" {
  name_prefix     = "ec2-launch"
  image_id        = var.ami_id
  instance_type   = var.instance_type
  security_groups = var.security_groups
}

# Create the Auto Scaling group
resource "aws_autoscaling_group" "ec2-asg" {
  name                      = "ec2-asg"
  availability_zones        = ["us-east-1a","us-east-1b"]
  max_size                  = var.asg_max_size
  min_size                  = var.asg_min_size
  health_check_grace_period = var.health_check_grace_period
  desired_capacity          = var.asg_desired_capacity
  launch_configuration      = aws_launch_configuration.ec2-launch.id

  tag {
    key                 = "Name"
    value               = "asg"
    propagate_at_launch = true
  }
}
resource "aws_autoscaling_policy" "web_policy_up" {
  name                   = "web_policy_up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.ec2-asg.name
}

resource "aws_cloudwatch_metric_alarm" "web_cpu_alarm_up" {
  alarm_name          = "web_cpu_alarm_up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.ec2-asg.name
  }

  alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions     = [aws_autoscaling_policy.web_policy_up.arn]
}