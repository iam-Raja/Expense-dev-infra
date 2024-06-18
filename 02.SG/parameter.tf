resource "aws_ssm_parameter" "SG_ID_FRONTEND" {
  name  = "/${var.project_name}/${var.environment}/SG_ID_FRONTEND"
  type  = "String"
  value = module.frontend.sg_id
}


resource "aws_ssm_parameter" "SG_ID_BACKEND" {
  name  = "/${var.project_name}/${var.environment}/SG_ID_BACKEND"
  type  = "String"
  value = module.backend.sg_id
}


resource "aws_ssm_parameter" "SG_ID_DB" {
  name  = "/${var.project_name}/${var.environment}/SG_ID_DB"
  type  = "String"
  value = module.db.sg_id
}

resource "aws_ssm_parameter" "SG_ID_BASTION" {
  name  = "/${var.project_name}/${var.environment}/SG_ID_BASTION"
  type  = "String"
  value = module.bastion.sg_id
}

resource "aws_ssm_parameter" "SG_ID_VPN" {
  name  = "/${var.project_name}/${var.environment}/SG_ID_vpn"
  type  = "String"
  value = module.vpn.sg_id
}
resource "aws_ssm_parameter" "SG_ID_PRIVATE-ALB" {
  name  = "/${var.project_name}/${var.environment}/SG_ID_PRIVATE-ALB"
  type  = "String"
  value = module.private_alb.sg_id
}

resource "aws_ssm_parameter" "SG_ID_PUBLIC-ALB" {
  name  = "/${var.project_name}/${var.environment}/SG_ID_PUBLIC-ALB"
  type  = "String"
  value = module.public_alb.sg_id
}