data "aws_ssm_parameter" "sg_id_db" {
  name = "/${var.project_name}/${var.environment}/SG_ID_DB"
}

data "aws_ssm_parameter" "database_subnet_group_name" {
  name = "/${var.project_name}/${var.environment}/database_subnet_group"
}