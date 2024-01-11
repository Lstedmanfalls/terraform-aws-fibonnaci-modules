provider "aws" {
  region = var.region
}

module "network" {
  source       = "./modules/network"
  project_name = var.project_name
  environment  = var.environment
}

data "aws_subnet" "new_subnet" {
  availability_zone = var.az

  filter {
    name   = "vpc_id"
    values = [module.network.vpc.vpc_id]
  }
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
  vpc_sg_ids    = [module.network.vpc.default_security_group_id]
  subnet_id     = data.aws_subnet.new_subnet.id
  depends_on    = [module.network]
}

# module "iam" {
#   source = "./modules/iam"
# }
