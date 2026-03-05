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

module "rds" {
  source              = "../../modules/rds"
  name                = local.name
  vpc_id              = module.network.vpc_id
  private_subnet_ids   = module.network.private_subnet_ids
  tags                = local.tags
}

module "addons" {
  source       = "../../modules/addons-helm"
  cluster_name = module.eks.cluster_name

  enable_ingress_nginx = true
  enable_istio         = false
  enable_kps           = true

  tags = local.tags

  # Make sure cluster exists before addons try to install
  depends_on = [module.eks]
}

module "app_irsa" {

  source = "../../modules/iam-irsa"

  name = "${local.name}-app-irsa"

  namespace = "app"

  service_account_name = "app-sa"

  oidc_provider_arn = module.eks.oidc_provider_arn

  oidc_issuer_url = module.eks.oidc_issuer_url

  policy_json = local.db_secret_policy

  tags = local.tags
}