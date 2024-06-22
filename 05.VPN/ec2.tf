resource "aws_key_pair" "vpn" {
  key_name   = "open-vpn"
  public_key = file("C:/devops/dev-trainings/dev-training-key.pub")
}

module "vpn" {
    
  source  = "terraform-aws-modules/ec2-instance/aws"
  key_name = aws_key_pair.vpn.key_name
  name = "${var.project_name}-${var.environment}-vpn"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.sg_id_vpn.value] # sg_id
  ami = data.aws_ami.ami_info.id
  subnet_id              = local.sub_pub_id #subnet id(pub,priv,db)
  tags = merge (
    var.common_tags,{
        Name="${var.project_name}-${var.environment}-vpn"
    }
  )
  }

  # vpn username:openvpn
  # ssh vpn openvpn@<ip>
