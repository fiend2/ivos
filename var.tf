/*
variable "access_key" {}
variable "secret_key" {}
*/
variable "region" {}

variable "ami" {
    type    = string
    default = "ami-033be6e7ed8de1043"
}
variable "instance_type" {
    type    = string
    default = "t2.micro"
  
}
/*
variable "ssh_key" {
    type = string
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYmsdm2eQW5YogpZg3YdNbQwUSjRYO5rXl6qIDeW5TNNutO/30EUruzOjdz4iceEIiMAJvDK3vf0A1XKySTN6oFZu/f43rjJ9Wunppc7EGnJoVs+lz0qVBHU8uGg904avWSlMSQp3tlT4znxMSFHFTKm54EpYOVX3G/tEw9+6l2CUKibVW0rDOXH1aoVZNaa+CSpTFSzxih9Svmrc+YYQi/qBht/jYf5DUPwZc2vfFXa2CbcC8MOI8Toia4jyv8HJ9SrIZiBYl/tZz9LdWQIl1axl4L+aQdfmQHphTXEjQjdI38j/KcY1bcDF4HaZshvRs4iKQe8ExXvuhElQWoFU1"
  
}
*/
variable "vpc_id" {
    type = string
    default = "vpc-6c929914"
}

variable "aws_s3_bucket_object" {
    type = string
    default = "test-0258"
}