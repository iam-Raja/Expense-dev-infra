resource "aws_ssm_parameter" "private_alb_listner_arn" {
  name  = "/${var.project_name}/${var.environment}/private_alb_listner_arn"
  type  = "String"
  value = aws_lb_listener.hhtp_listner.arn
}