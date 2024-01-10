module "ec2-instance" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "5.6.0"
  name                   = "${var.project_name}-${var.environment}-${var.ec2_instance_name}"
  instance_type          = var.ec2_instance_type
  monitoring             = var.ec2_monitoring
  vpc_security_group_ids = var.ec2_sg_ids
  subnet_id              = var.ec2_subnet_id
  availability_zone      = var.az

  tags = {
    Terraform   = "true"
    Environment = "${var.environment}"
  }
}