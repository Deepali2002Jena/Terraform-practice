variable "tag-name"{
  type= list
  default= ["deepali","sameer","saqib","sonal"]
}

resource "aws_instance" "ec2" {
  ami           = "ami-0fff1b9a61dec8a5f"
  instance_type = "t2.micro"
  count=3

  tags = {
    Name = var.tag-name[count.index]
  }
}
