data "aws_subnet" "az_subnet" {
  filter {
    name   = "availability_zone"
    values = [var.az]
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
  subnet_id              = data.aws_subnet.az_subnet.id

  tags = {
    Terraform   = "true"
    Environment = "${var.environment}"
  }
}
