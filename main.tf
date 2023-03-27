//resource "aws_default_vpc" "default" {
//}
data "aws_vpc" "default" {
  default = true
}
//Just commenting
resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow all inbound HTTP traffic"
  vpc_id      = data.aws_vpc.default.id
//just
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

//hi
resource "aws_instance" "my-instance" {
  ami                    = var.AMIS[var.region]
  instance_type          = var.instance_type
  availability_zone      = var.zone1
  key_name               = "jenkins"
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  user_data              = filebase64("httpd.sh")
  tags = {
    Name = "terraform instance"
  }
}
