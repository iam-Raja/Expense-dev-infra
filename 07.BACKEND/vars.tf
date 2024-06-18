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
    component="backend"
}
  
}
