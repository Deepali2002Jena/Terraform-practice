resource "aws_security_group" "new-tf-sg" {
  name        = "terraform-security-group"
  description = "allow http and ssh"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
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
resource "aws_instance" "web" {
  ami             = "ami-01816d07b1128cd2d"
  instance_type   = "t3.micro"
  security_groups= [aws_security_group.new-tf-sg.id]
 }

