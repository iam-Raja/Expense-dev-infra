resource "aws_lb" "my-alb-pub" {
  name               = "${var.project_name}-${var.environment}-public-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_ssm_parameter.public_alb_sg_id.value]
  subnets            = split(",", data.aws_ssm_parameter.subnet_public.value)
  enable_deletion_protection = false

  tags =merge (
    var.common_tags,{
        Name="${var.project_name}-${var.environment}-public-alb"
    }
  )
}

#listener

resource "aws_lb_listener" "hhtp_listner" {
  load_balancer_arn = aws_lb.my-alb-pub.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Fixed response content From Public ALB</h1>"
      status_code  = "200"
    }
  }
}

resource "aws_lb_listener" "https_listner" {
  load_balancer_arn = aws_lb.my-alb-pub.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn = data.aws_ssm_parameter.acm_certificate_arn.value
  ssl_policy = "ELBSecurityPolicy-2016-08"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Fixed response content From Public ALB HTTPS </h1>"
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
      name    = "web.app-${var.environment}"
      type    = "A"
      allow_overwrite=true
   alias   = {
        name    = aws_lb.my-alb-pub.dns_name
        zone_id = aws_lb.my-alb-pub.zone_id
   }
    }
    ]
}
