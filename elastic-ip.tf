resource "aws_eip" "my-eip" {
  instance = aws_instance.web.id //instance id
  domain   = "vpc"
}
