module "network" {
  source = "../../modules/network"
  name   = local.name
  cidr   = var.vpc_cidr
  azs    = var.azs
  tags   = local.tags
}

module "eks" {
  source             = "../../modules/eks"
  cluster_name       = local.name
  vpc_id             = module.network.vpc_id
  private_subnet_ids  = module.network.private_subnet_ids
  tags               = local.tags
}