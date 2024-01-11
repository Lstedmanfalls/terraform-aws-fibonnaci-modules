data "aws_subnet" "subnet_id" {
  availability_zone = var.az

  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

module "ec2-instance" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "5.6.0"
  availability_zone      = var.az
  name                   = "${var.project_name}-${var.environment}-${var.instance_name}"
  instance_type          = var.instance_type
  count                  = var.num_instances
  monitoring             = var.monitoring
  vpc_security_group_ids = var.vpc_sg_ids
  subnet_id              = data.aws_subnet.subnet_id.id

  tags = {
    Terraform   = "true"
    Environment = "${var.environment}"
  }
}
