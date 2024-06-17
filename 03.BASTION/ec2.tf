module "bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-bastion"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.sg_id_bastion.value] # sg_id
  ami = data.aws_ami.ami_info.id
  subnet_id  = local.sub_pub_id #subnet id(pub,priv,db)
  user_data = file("bastion.sh")
  tags = merge (
    var.common_tags,{
        Name="${var.project_name}-${var.environment}-bastion"
    }
  )
  }
