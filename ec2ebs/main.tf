resource "aws_ebs_volume" "ec2-ebs" {
  availability_zone = "us-east-1a"
  size              = var.size
  tags = {
    Name = "ebs-ec2"
  }
}

resource "aws_instance" "ec2ebs" {
  ami               = var.ami_id
  availability_zone = "us-east-1a"
  instance_type     = var.instance_type

  tags = {
    Name = "ec2"
  }
}

resource "aws_volume_attachment" "ebs-attach" {
  device_name =  "/dev/sdh"
  volume_id   = aws_ebs_volume.ec2-ebs.id
  instance_id = aws_instance.ec2ebs.id
}