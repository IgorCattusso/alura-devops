terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 4.16"
        }
    }

    required_version = ">= 1.2.0"
}

provider "aws" {
    region  = "us-east-2"
}

resource "aws_instance" "app_server" {
    ami           = "ami-05fb0b8c1424f266b"
    instance_type = "t2.micro"
    key_name      = "alura-devops"
    # The user_data below will create a file named index.html containing a H1 tag
    # nohup = keeps the process running | busybox = to execute various unix utilities | httpd = to run in an apache http server
    # user_data = <<-EOF
    #     #!/bin/bash
    #     sudo apt-get update
    #     cd /home/ubuntu
    #     echo "<h1>Feito com Terraform</h1>" > index.html
    #     nohup busybox httpd -f -p 8080 &
    # EOF


    tags = {
        Name = "Alura DevOps - Ansible Python"
    }
}
