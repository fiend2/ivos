provider "aws" {
  region = "us-west-2"
}

locals {
         ingress_rules = [
        {
            port = 22
        },
        {
            port = 80
        },
        {
            port = 81
        }
  ]
}
resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-6c929914"


        dynamic "ingress" {
            for_each     = local.ingress_rules

          content {
            from_port  = ingress.value.port
                 to_port     = ingress.value.port
                 protocol    = "tcp"
                 cidr_blocks = ["0.0.0.0/0"]
           }
        }
        tags = {
        Name = "sg"
}
}

resource "aws_instance" "testing" {
    ami           = "ami-0d038c75b3e9426f7"
    instance_type = "t2.micro"
    key_name = "transit_test.pem"
    user_data = <<-EOF
                #!/bin/bash
                apt install httpd -y
                echo "My first" > /var/www/html/index.html
                apt update -y
                service httpd start
                EOF
    tags = {
        Name = "test"
    }
}


output "owner_id_and_arn" {
  value = "owner_id = ${aws_security_group.sg.owner_id} and arn = ${aws_security_group.sg.arn}"
}

