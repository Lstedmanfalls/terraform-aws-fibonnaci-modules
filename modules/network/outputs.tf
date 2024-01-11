output "vpc_id" {
  value = module.vpc.default_vpc_id
}

output "aws_availability_zones" {
  value = data.aws_availability_zones.all.names
}
