resource "aws_instance" "my-ec2" {
  ami             = "ami-0ebfd941bbafe70c6"
  key_name        = "new-tf-key"
  security_groups = ["new-sg"]
  instance_type   = "t2.micro"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("/root/terraform-practice/ram")
    host        = self.public_ip

  }
  provisioner "file" {
    source      = "/tmp/redhat"
    destination = "/tmp/redhat"
  }
  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> /root/private_ips.txt"
  }
  provisioner "remote-exec" {
    inline = [
      "touch hello.txt",
      "echo helloworld remote provisioner >>hello.txt",
    ]
  }

  tags = {
    Name = "ServerA"

  }
}
