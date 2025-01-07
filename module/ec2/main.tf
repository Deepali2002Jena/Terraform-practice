resource "aws_security_group" "new-tf-sg" {
  name        = "new-sg"
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

resource "aws_key_pair" "deployer" {
  key_name   = "my-tf-key"
  public_key = file("/root/tf-prac/deepali.pub")
}

resource "aws_instance" "my-ec2" {
  ami           = var.ami-id
  key_name= aws_key_pair.deployer.id
  security_groups=["new-sg"]
  instance_type = "t3.micro"
}

