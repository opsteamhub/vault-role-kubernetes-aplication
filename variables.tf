variable "aws_account_id" {}

variable "aws_region" {}

variable "application" {
    type = list(string)
    default = []  
}

variable "environment" {
  default = ""
}

variable "token_ttl" {
  type = number
  default = 3600
  
}

variable "bound_service_account_names" {
  default = "default"
}