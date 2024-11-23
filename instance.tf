resource "aws_instance" "web1" {
  ami           = "ami-012967cc5a8c9f891"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_sub1.id

  tags = {
    Name = var.instance1_name
  }
}

resource "aws_instance" "web2" {
  ami           = "ami-012967cc5a8c9f891"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_sub2.id

  tags = {
    Name = var.instance2_name
  }
}
