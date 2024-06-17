module "my_vpc" {
   ## source= "../terraform-module-vpc-sorce"
    source= "git::https://github.com/iam-Raja/terraform-module-vpc-source.git?ref=main" ##refering after pushing to git
    project_name = var.project_name
    environment = var.environment
    common_tags = var.common_tags
    public_subnet_cidrs = var.public_subnet_cidrs
    private_subnet_cidrs = var.private_subnet_cidrs
    database_subnet_cidrs = var.database_subnet_cidrs
    is_peering_required = var.is_peering_required
    target_vpc_id = var.target_vpc_id
}