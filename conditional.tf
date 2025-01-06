resource "aws_instance" "my-ec2"{
  instance_type= var.environment=="development" ? "t2.micro" : "t2.large"
  ami= "ami-0453ec754f44f9a4a"
}
