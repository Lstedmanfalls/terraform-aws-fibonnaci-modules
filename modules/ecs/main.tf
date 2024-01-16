resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.project_name}-${var.environment}"
}

resource "aws_launch_configuration" "ecs_launch_config" {
  name            = "${var.project_name}-${var.environment}-launch-config"
  image_id        = "ami-05803413c51f242b7"
  instance_type   = var.instance_type
  security_groups = var.vpc_sg_ids

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "ecs_autoscaling_group" {
  desired_capacity          = var.num_instances
  max_size                  = var.max_instances
  min_size                  = var.min_instances
  vpc_zone_identifier       = [var.subnet_id]
  launch_configuration      = aws_launch_configuration.ecs_launch_config.id
  health_check_type         = "EC2"
  health_check_grace_period = 300
}

resource "aws_ecs_service" "app" {
  name       = "${var.project_name}-${var.environment}"
  cluster    = aws_ecs_cluster.ecs_cluster.id
  depends_on = [aws_ecs_cluster.ecs_cluster]

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [${var.az}]"
  }
}
