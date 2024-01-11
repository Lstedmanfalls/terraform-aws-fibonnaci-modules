output "vpc_id" {
  value = module.vpc.default_vpc_id
}

output "sg_id" {
  value = module.vpc.default_security_group_id
}
