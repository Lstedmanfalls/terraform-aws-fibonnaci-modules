variable "region" {
  description = "AWS region to deploy these resources into"
  type        = string
}

variable "az" {
  description = "The regoin's availability zone to deploy these resources into"
}

variable "project_name" {
  description = "Application, service, etc. that will use these resources"
  type        = string
}

variable "environment" {
  description = "Environment to deploy these resources into (development, staging, or production)"
  type        = string
}

variable "ec2_instance_name" {
  description = "Unique name for this ec2 instance. Environment and project_name will be prefixed automatically to the name"
  type        = string
}

variable "ec2_instance_type" {
  description = "Type and size of ec2 instance to create"
  type        = string
  default     = "t3.micro"
}

variable "ec2_monitoring" {
  description = "Whether to enable ec2 detailed monitoring"
  type        = bool
  default     = false
}

variable "ec2_sg_ids" {
  description = "List of vpc security group ids to associate with this ec2 instance"
  type        = list(string)
}

variable "ec2_subnet_id" {
  description = "Subnet to deploy this ec2 instance into"
  type        = string
}
