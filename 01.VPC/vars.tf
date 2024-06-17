variable "common_tags" {
    default={
        Name="main"
        created="raja"
        Module="VPC"
        terraform=true
    }
}
variable "project_name" {
 default = "expense"  
}
variable "environment" {
    type = string
    default = "dev"  
}

#### public-Subnet #####

variable "public_subnet_cidrs" {
    default = ["10.0.1.0/24","10.0.2.0/24"]
  
}

#### private-Subnet #####

variable "private_subnet_cidrs" {
    default = ["10.0.11.0/24","10.0.12.0/24"]
  
}

#### database-Subnet #####

variable "database_subnet_cidrs" {
    default = ["10.0.21.0/24","10.0.22.0/24"]
  
}

### peering ##

variable "is_peering_required" {
    default = true
  
}
variable "target_vpc_id" {
    default = ""
  
}