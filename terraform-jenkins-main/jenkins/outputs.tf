output "instance_id" {
  description = "ID of EC2 instance"
  value       = aws_instance.jenkins_ec2_instance_ip.id
}
 
output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.jenkins_ec2_instance_ip.public_ip
}
