module "vpc" {
  source         = "terraform-aws-modules/vpc/aws"
  name           = "${var.project_name}-${var.environment}"
  azs            = [var.az]
  public_subnets = [for v in [var.az] : cidrsubnet("10.0.0.0/16", 8, v + 4)]
}
