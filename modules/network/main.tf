module "vpc" {
  source         = "terraform-aws-modules/vpc/aws"
  name           = "${var.project_name}-${var.environment}"
  azs            = local.azs
  public_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 4)]
}

data "aws_availability_zones" "all" {}

data "aws_subnet" "new_subnet" {
  availability_zone = var.az

  filter {
    name   = "vpc_id"
    values = [module.network.vpc_id]
  }
}
