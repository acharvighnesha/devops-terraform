resource "aws_vpc" "demo" {
  cidr_block = "10.100.0.0/16"
tags = {
    Name = "main"
}
}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = "10.100.1.0/24"

  tags = {
    Name = "main-public-1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = "10.100.2.0/24"

  tags = {
    Name = "main-public-2"
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = "10.100.3.0/24"

  tags = {
    Name = "main-private-1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = "10.100.4.0/24"

  tags = {
    Name = "main-private-2"
  }
}

resource "aws_eip" "lb" {
  vpc      = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.demo.id

  tags = {
    Name = "igw"
  }
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.public1.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}
