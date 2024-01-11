output "vpc_id" {
  value = module.vpc.default_vpc_id
}

output "aws_availability_zones" {
  value = data.aws_availability_zones.all.names
}

output "new_subnet_in_az" {
  value = data.aws_subnet.new_subnet.id
}

output "sg_id" {
  value = module.vpc.default_security_group_id
}
