variable "ami_id" {}
variable "instance_type" {}
variable "tag_name" {}
variable "subnet_id" {}
variable "sg_for_jenkins" {}
variable "enable_public_ip_address" {}


output "jenkins_ec2_instance_id" {
  value = aws_instance.jenkins_ec2_instance_ip.id
}

output "dev_proj_1_ec2_instance_public_ip" {
  value = aws_instance.jenkins_ec2_instance_ip.public_ip
}

output "private_key_pem" {

  description = "Private key PEM for the EC2 instance"
  sensitive   = true
  value = aws_ssm_parameter.private_key.value
  
}

output "private_key_pem" {

  description = "Private key PEM for the EC2 instance"
  sensitive   = true
  value = aws_ssm_parameter.private_key.value
  
}

output "dev_proj_1_ec2_instance_public_ip" {
  value = aws_instance.jenkins_ec2_instance_ip.public_ip
}


# Generate SSH key pair
resource "tls_private_key" "demo_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Store private key in SSM Parameter Store
resource "aws_ssm_parameter" "private_key" {
  name        = "/ssh/demo-keypair/private"
  description = "Private SSH key for EC2 demo"
  type        = "SecureString"
  value       = tls_private_key.demo_key.private_key_pem

  tags = {
    environment = "demo"
  }
}

# Create AWS key pair using the public key
resource "aws_key_pair" "demo_keypair" {
  key_name   = "awsdevops-jenkins-demo-keypair"
  public_key = tls_private_key.demo_key.public_key_openssh
}

resource "aws_instance" "jenkins_ec2_instance_ip" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = var.tag_name
  }
  key_name                    = aws_key_pair.demo_keypair.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.sg_for_jenkins
  associate_public_ip_address = var.enable_public_ip_address

}
