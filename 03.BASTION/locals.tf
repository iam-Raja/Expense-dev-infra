locals {
    ## converting stringlist to string and getting first element
  sub_pub_id=element(split(",", data.aws_ssm_parameter.subnet_public.value), 0) 
}