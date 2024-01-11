provider "aws" {
  region = var.region
}

module "network" {
  source       = "./modules/network"
  project_name = var.project_name
  environment  = var.environment
}

data "aws_subnet" "public" {
  for_each   = toset(module.network.public_subnets)
  id         = each.key
  depends_on = [module.network]
}
module "ec2" {
  source        = "./modules/ec2"
  project_name  = var.project_name
  environment   = var.environment
  az            = var.az
  instance_name = var.instance_name
  instance_type = var.instance_type
  num_instances = var.num_instances
  monitoring    = var.monitoring
  vpc_sg_ids    = [module.network.default_security_group_id]
  subnet_id     = local.subnet_id
  depends_on    = [module.network]
}

# module "iam" {
#   source = "./modules/iam"
# }
