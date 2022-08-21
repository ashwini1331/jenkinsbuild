provider "aws" {
  region = "ap-south-1"
  #access_key="${var.access_key}"
  #secret_key="${var.secret_key}"
}
resource "aws_security_group" "splunk" {
  name        = "terraform-splunk"
  description = "Created by terraform"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "splunk" {
  connection {
    user        = "ubuntu"
    private_key = file("xyz.pem")
    host        = "${self.public_ip}"
  }
  instance_type   = "t2.micro"
  ami             = "ami-006d3995d3a6b963b"
  key_name        = "xyz"
  security_groups = ["${aws_security_group.splunk.name}"]
  tags = {
    Name = "splunk_server"
  }
  provisioner "remote-exec" {
    inline = [
      # Use code with Ubuntu 20.04 version #
      "ping -c 10 8.8.8.8",
      "sudo apt-get -y update",
      "curl -sSL https://raw.githubusercontent.com/ashwini1331/jenkinsbuild/main/jenkins.sh | bash",
    ]
  }
}

