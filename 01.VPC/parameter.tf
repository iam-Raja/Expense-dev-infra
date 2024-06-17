resource "aws_ssm_parameter" "VPC_ID" {
  name  = "/${var.project_name}/${var.environment}/VPC_ID"
  type  = "String"
  value = module.my_vpc.vpc_id
}


## terraform list ["a1","a2"]
## aws lis [a1,a2]

resource "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/public_subnet_ids"
  type  = "String" 
  value = join(",", module.my_vpc.public_subnet_ids) # join will convert string to stringlist
}

resource "aws_ssm_parameter" "private_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/private_subnet_ids"
  type  = "String"
  value = join(",",module.my_vpc.private_subnet_ids) # join will convert string to stringlist
}


resource "aws_ssm_parameter" "db_subnet_id" {
  name  = "/${var.project_name}/${var.environment}/db_subnet_ids"
  type  = "String"
  value = join(",",module.my_vpc.database_subnet_ids) # join will convert string to stringlist
}

## For Dbsubnet group name

resource "aws_ssm_parameter" "database_subnet_group_name" {
  name  = "/${var.project_name}/${var.environment}/database_subnet_group"
  type  = "String"
  value = module.my_vpc.database_subnet_group 
}