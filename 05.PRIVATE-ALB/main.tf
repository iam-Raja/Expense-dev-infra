resource "aws_lb" "my-alb" {
  name               = "${var.project_name}-${var.environment}-private-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [data.aws_ssm_parameter.sg_id_vpn.value]
  subnets            = split(",", data.aws_ssm_parameter.subnet_private.value)
  enable_deletion_protection = false

  tags =merge (
    var.common_tags,{
        Name="${var.project_name}-${var.environment}-private-alb"
    }
  )
}

#listener

resource "aws_lb_listener" "hhtp_listner" {
  load_balancer_arn = aws_lb.my-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Fixed response content From Private ALB</h1>"
      status_code  = "200"
    }
  }
}

#R53 record for alb name
module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = var.zone_name

  records = [
    {
      name    = "*.app-${var.environment}"
      type    = "A"
      allow_overwrite=true
   alias   = {
        name    = aws_lb.my-alb.dns_name
        zone_id = aws_lb.my-alb.zone_id
   }
    }
    ]
}
