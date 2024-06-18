data "aws_ssm_parameter" "subnet_public" {
  name = "/${var.project_name}/${var.environment}/public_subnet_ids"
}

data "aws_ssm_parameter" "public_alb_sg_id" {
  name = "/${var.project_name}/${var.environment}/SG_ID_PUBLIC-ALB"
}
