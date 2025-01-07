resource "aws_instance" "new-ec2" {
  ami           = "ami-0ebfd941bbafe70c6"
  key_name      = "new-tf-key"
  security_groups= ["new-sg"]
  instance_type = "t2.micro"
   
  user_data= <<-EOF
   #!/bin/bash
   sudo yum install httpd -y
   sudo systemctl enable --now httpd.service
   sudo echo "<h1>Hello World $(hostname -f)</h1>">/var/www/html/index.html
 EOF
  tags = {
    Name = "ServerA"
  }

}
