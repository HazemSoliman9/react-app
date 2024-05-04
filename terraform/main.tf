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
    root_block_device {
    volume_size = 30
    volume_type = "gp2"
    encrypted   = false
  }
}