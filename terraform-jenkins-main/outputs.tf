output "key_ssm_param" {
  value = aws_ssm_parameter.private_key.name
}

output "public_ip" {
  value = aws_instance.jenkins_ec2_instance_ip.public_ip
}
