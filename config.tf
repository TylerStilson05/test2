terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "example" {
  #change the ami for a current one
  ami           = "ami-02e136e904f3da870"
  instance_type = "t2.micro"
  key_name      = "vockey"
  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${self.public_ip},' -u ec2-user --private-key ~/Downloads/labsuser.pem test2.yml"
}
}
