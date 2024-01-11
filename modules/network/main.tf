module "vpc" {
  source         = "terraform-aws-modules/vpc/aws"
  name           = "${var.project_name}-${var.environment}"
  azs            = local.azs
  public_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 4)]
}

data "aws_availability_zones" "all" {}
