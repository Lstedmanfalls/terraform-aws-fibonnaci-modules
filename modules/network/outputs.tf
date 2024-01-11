output "vpc_id" {
  value = module.vpc.default_vpc_id
}

output "aws_availability_zones" {
  value = module.vpc.azs
}

output "sg_id" {
  value = module.vpc.default_security_group_id
}
