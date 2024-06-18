module "backend" {
    
  source  = "terraform-aws-modules/ec2-instance/aws"
  
  name = "${var.project_name}-${var.environment}-${var.common_tags.component}"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.sg_id_backend.value] # sg_id
  ami = data.aws_ami.ami_info.id
  subnet_id              = local.sub_ptivate_id #subnet id(pub,priv,db)
  user_data = file("backend.sh")
  tags = merge (
    var.common_tags,{
        Name="${var.project_name}-${var.environment}-${var.common_tags.component}"
    }
  )
  }

resource "null_resource" "backend" {
  
  triggers = {
   instance_id = module.backend.id
  }
  connection {

    type="ssh"
    user="ec2-user"
    password = "DevOps321"
    host=module.backend.private_ip
  }
    provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/${var.common_tags.component}.sh",
      "sudo sh /tmp/${var.common_tags.component}.sh ${var.common_tags.component} ${var.environment}"

    ]
  }

  }

resource "aws_ec2_instance_state" "backend" {
  instance_id = module.backend.id
  state       = "stopped"
  #stop the server only when null resource provisioning is completed
  depends_on = [ null_resource.backend ]
}

resource "aws_ami_from_instance" "backend" {
  name               = "${var.project_name}-${var.environment}-${var.common_tags.component}"
  source_instance_id = module.backend.id
  depends_on = [ aws_ec2_instance_state.backend ]
}
 