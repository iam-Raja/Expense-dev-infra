variable "project_name" {
    type=string
    default="expense"

}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    type= map
    default = {
    project="expense"
    Environment="dev"
    terraform=true
    component="acm"
}
  
}

variable "zone_id" {
    default = "Z07779852ESP6TKS0688R"
  
}
