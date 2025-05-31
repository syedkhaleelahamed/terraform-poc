output "jenkins_ec2_instance_id" {
  value = module.jenkins.instance_id
}

output "public_ip" {
  value = module.jenkins.instance_public_ip
}
