data "aws_ssm_parameter" "subnet_public" {
  name = "/${var.project_name}/${var.environment}/public_subnet_ids"
}

data "aws_ssm_parameter" "sg_id_frontend" {
  name = "/${var.project_name}/${var.environment}/SG_ID_FRONTEND"
}

data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.environment}/VPC_ID"
}
data "aws_ssm_parameter" "public_alb_listner_https" { 
  name = "/${var.project_name}/${var.environment}/public_alb_listner_arn_https"
}

data "aws_ami" "ami_info" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}