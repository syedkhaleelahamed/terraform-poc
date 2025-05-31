output "jenkins_ec2_instance_id" {
  value = jenkins.aws_instance.jenkins_ec2_instance_ip.id
}

output "private_key_pem" {

  description = "Private key PEM for the EC2 instance"
  sensitive   = true
  value = jenkins.aws_ssm_parameter.private_key.value
  
}

output "public_ip" {
  value = jenkins.aws_instance.jenkins_ec2_instance_ip.public_ip
}
