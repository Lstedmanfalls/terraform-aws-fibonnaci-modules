locals {
  availability_zone_subnets = {
    for s in data.network.public : s.availability_zone => s.id...
  }

  subnet_id = [for subnet_ids in availability_zone_subnets : subnet_ids[0]][0]
}
