resource "aws_vpc" "terraform_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "public_sub1" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_sub1" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "${var.region}a"
}

resource "aws_subnet" "public_sub2" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_sub2" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "${var.region}b"
}

resource "aws_internet_gateway" "terraform_ig" {
  vpc_id = aws_vpc.terraform_vpc.id
}

resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_ig.id
  }
}

resource "aws_route_table_association" "public_rt_assoc_1" {
  subnet_id      = aws_subnet.public_sub1.id
  route_table_id = aws_route_table.route_table_public.id
}

resource "aws_route_table_association" "public_rt_assoc_2" {
  subnet_id      = aws_subnet.public_sub2.id
  route_table_id = aws_route_table.route_table_public.id
}
