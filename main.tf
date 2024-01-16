provider "aws" {
  region = var.region
}

module "network" {
  source       = "./modules/network"
  project_name = var.project_name
  environment  = var.environment
  az           = var.az
}

module "ecs" {
  source        = "./modules/ecs"
  environment   = var.environment
  project_name  = var.project_name
  vpc_sg_ids    = [module.network.sg_id]
  subnet_id     = module.network.subnet_id
  instance_type = var.instance_type
  num_instances = var.num_instances
  min_instances = var.min_instances
  max_instances = var.max_instances
  depends_on    = [module.network]
}

module "ecr" {
  source       = "./modules/ecr"
  environment  = var.environment
  project_name = var.project_name
}
