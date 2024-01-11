output "vpc_id" {
  value = module.vpc.default_vpc_id
}

output "sg_id" {
  value = module.vpc.default_security_group_id
}

output "subnet_id" {
  value = module.vpc.public_subnets[0]
}
