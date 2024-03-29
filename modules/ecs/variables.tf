variable "project_name" {
  description = "Application, service, etc. that will use these resources"
  type        = string
  nullable    = false
}

variable "environment" {
  description = "Environment to deploy these resources into (development, staging, or production)"
  type        = string
  nullable    = false
}

variable "instance_type" {
  description = "Type and size of ec2 instance to create"
  type        = string
  default     = "t2.micro"
}

variable "num_instances" {
  description = "The number of ec2 instances to deploy"
  type        = number
  default     = 1
}

variable "max_instances" {
  description = "The max number of ec2 instances to scale"
  type        = number
  default     = 3
}

variable "min_instances" {
  description = "The min number of ec2 instances to scale"
  type        = number
  default     = 1
}

variable "vpc_sg_ids" {
  description = "List of vpc security group ids to associate with this ec2 instance"
  type        = list(string)
  nullable    = false
  sensitive   = true
}

variable "subnet_id" {
  description = "List of the subnet id to deploy this ec2 instance into"
  type        = string
  nullable    = false
  sensitive   = true
}

variable "az" {
  description = "The region's availability zone to deploy these resources into"
  nullable    = false
}
