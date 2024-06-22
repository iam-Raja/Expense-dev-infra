resource "aws_ssm_parameter" "pub_alb_listner_arn" {
  name  = "/${var.project_name}/${var.environment}/public_alb_listner_arn"
  type  = "String"
  value = aws_lb_listener.hhtp_listner.arn
}

resource "aws_ssm_parameter" "pub_alb_listner_arn_https" {
  name  = "/${var.project_name}/${var.environment}/public_alb_listner_arn_https"
  type  = "String"
  value = aws_lb_listener.https_listner.arn
}