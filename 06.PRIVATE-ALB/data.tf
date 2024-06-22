data "aws_ssm_parameter" "subnet_private" {
  name = "/${var.project_name}/${var.environment}/private_subnet_ids"
}

data "aws_ssm_parameter" "sg_id_private_alb" {
  name = "/${var.project_name}/${var.environment}/SG_ID_PRIVATE-ALB"
}
