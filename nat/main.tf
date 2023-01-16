resource "aws_vpc" "my-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my-vpc"
  }
}


resource "aws_subnet" "subnet-private" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.availability_zone

  tags = {
    Name = "prod"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my-vpc.id

}


resource "aws_network_interface" "web-server-nic" {
  subnet_id       = aws_subnet.subnet-private.id
  private_ips     = ["10.0.1.50"]
  
  
}

resource "aws_nat_gateway" "nat" {
  subnet_id     = aws_subnet.subnet-private.id
  connectivity_type = "private"
  tags = {
    Name = "gw-NAT"
  }
}

resource "aws_eip" "one" {
  vpc                       = true
  network_interface         = aws_network_interface.web-server-nic.id
  associate_with_private_ip = "10.0.1.50"
  depends_on                = [aws_nat_gateway.nat]
}
