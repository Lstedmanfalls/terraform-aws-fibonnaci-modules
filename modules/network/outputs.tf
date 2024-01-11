output "vpc_id" {
  value = aws_vpc.this[0].id
}

output "aws_availability_zones" {
  value = data.aws_availability_zones.all.names
}

output "sg_id" {
  value = aws_vpc.this[0].default_security_group_id
}
