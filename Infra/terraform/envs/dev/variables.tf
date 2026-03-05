variable "region" {
  type    = string
  default = "us-east-1"
}

variable "org" {
  type    = string
  default = "xabiere"
}

variable "project" {
  type    = string
  default = "platform"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "owner" {
  type    = string
  default = "Corey L. Ducre"
}

variable "vpc_cidr" { type = string }
variable "azs"      { type = list(string) }

variable "tags" {
  type    = map(string)
  default = {}
}