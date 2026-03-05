variable "cluster_name" { type = string }

variable "enable_ingress_nginx" { type = bool default = true }
variable "enable_istio"         { type = bool default = false }
variable "enable_kps"           { type = bool default = true } # kube-prometheus-stack

variable "tags" {
  type    = map(string)
  default = {}
}