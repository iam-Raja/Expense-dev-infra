data "aws_ssm_parameter" "subnet_private" {
  name = "/${var.project_name}/${var.environment}/private_subnet_ids"
}

data "aws_ssm_parameter" "sg_id_backend" {
  name = "/${var.project_name}/${var.environment}/SG_ID_BACKEND"
}

data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.environment}/VPC_ID"
}
data "aws_ssm_parameter" "alb_listner" {
  name = "/${var.project_name}/${var.environment}/private_alb_listner_arn"
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