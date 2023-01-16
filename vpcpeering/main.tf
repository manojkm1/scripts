resource "aws_vpc" "vpc1" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_vpc" "vpc2" {
  cidr_block = "10.2.0.0/16"
}

resource "aws_vpc_peering_connection" "vpc1" {
  peer_vpc_id   = aws_vpc.vpc2.id
  vpc_id        = aws_vpc.vpc1.id
  auto_accept   = true

  tags = {
    Name = "VPC Peering between foo and bar"
  }
}