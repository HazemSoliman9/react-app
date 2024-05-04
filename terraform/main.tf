provider "aws" {
    region = "us-east-1"
    
}
  
resource "aws_instance" "UbuntuInstance" {
    ami           = "ami-04b70fa74e45c3917"
    instance_type = "t3.medium"
    security_groups = ["${aws_security_group.ServerSG.name}"]
    key_name      = "ubuntu-key-pair"
    
    
    tags = {
    name = "Ubuntu-Server-Instance"
  }
}