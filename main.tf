provider "aws" {
   region     = var.region   
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
  vpc_id      = var.vpc_id
  
	
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
