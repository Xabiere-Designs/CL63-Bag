locals {
  name = "${var.org}-${var.project}-${var.env}"

  tags = merge(var.tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
    Project     = var.project
    Owner       = var.owner
  })
}
