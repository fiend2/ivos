provider "aws" {
   region     = var.region
  /* access_key = var.access_key
   secret_key = var.secret_key    */
   
}

resource "aws_instance" "ec2_example" {

    ami                    = var.ami 
    instance_type          = var.instance_type 
   // key_name               = "aws_key"
   // vpc_security_group_ids = [aws_security_group.sg.id]
/*
     connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("C:/Users/Noob/Downloads/transit_test.pem")
   }

  provisioner "file" {
    content      = "ip-address is: ${self.public_ip}"
    destination = "/home/ubuntu/ip.log"
  }

  provisioner "file" {
    source      = "new_user_credentials.csv"
    destination = "/home/ubuntu/new_user_credentials.csv"
  }
 */
}
/*
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.s3-global.accesspoint"
  vpc_endpoint_type = "Interface"

  security_group_ids = [aws_security_group.sg.id]

  private_dns_enabled = true
}

resource "aws_s3_bucket_object" "test-0258_object" {
  key    = "new_user_credentials.csv"
  bucket = var.aws_s3_bucket_object
  source = "new_user_credentials.csv"
}
*/
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
/*
resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = var.ssh_key
}

*/