provider "aws" {
  region  = "${var.aws_region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
    default = "us-east-1"
}

resource "aws_instance" "linux" {
  count = "1"
  ami           = "ami-090fa75af13c156b4"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name= "ansible_key"
  tags = {
    Name = "linux"
  }
  user_data = <<-EOF
    #!/bin/bash
    sudo amazon-linux-extras install ansible2
    ansible --version
  EOF
}