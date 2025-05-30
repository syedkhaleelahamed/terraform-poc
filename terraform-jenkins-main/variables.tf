variable "vpc_cidr" {
  type        = string
  description = "Public Subnet CIDR values"
}

variable "vpc_name" {
  type        = string
  description = "DevOps Project 1 VPC 1"
}

variable "cidr_public_subnet" {
  type        = list(string)
  description = "Public Subnet CIDR values"
}

variable "cidr_private_subnet" {
  type        = list(string)
  description = "Private Subnet CIDR values"
}

variable "eu_availability_zone" {
  type        = list(string)
  description = "Availability Zones"
}


variable "bucket_name" {
  type        = string
  description = "Remote state bucket name"
}

variable "ec2_ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
}
variable "public_key" {
  type        = string
  description = "Public key for the EC2 instance"
}