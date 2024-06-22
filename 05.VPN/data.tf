data "aws_ssm_parameter" "subnet_public" {
  name = "/${var.project_name}/${var.environment}/public_subnet_ids"
}

data "aws_ssm_parameter" "sg_id_vpn" {
  name = "/${var.project_name}/${var.environment}/SG_ID_vpn"
}

data "aws_ami" "ami_info" {

  filter {
    name   = "name"
    values = ["OpenVPN Access Server Community Image-fe8020db-*"]
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