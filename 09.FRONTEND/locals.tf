locals {
    ## converting stringlist to string and getting first element
  subnet_public=element(split(",", data.aws_ssm_parameter.subnet_public.value), 0) 
}