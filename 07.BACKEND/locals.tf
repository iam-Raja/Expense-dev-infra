locals {
    ## converting stringlist to string and getting first element
  sub_ptivate_id=element(split(",", data.aws_ssm_parameter.subnet_private.value), 0) 
}