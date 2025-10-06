module "terra_vpc" {
  source   = "../modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}

module "subnets" {
  source               = "../modules/subnets"
  depends_on           = [module.terra_vpc.vpcid]
  vpc_id               = module.terra_vpc.vpcid
  vpc_name             = var.vpc_name
  azs                  = var.azs
  private_subnets_name = var.private_subnets_name
  public_subnets_name  = var.public_subnets_name
  private_subnets_cidr = var.private_subnets_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  env                  = var.env
  public_rt_id         = module.terra_vpc.public_rt_id
  private_rt_id        = module.terra_vpc.private_rt_id
}

module "flowlogs" {
  source           = "../modules/flowlogs"
  depends_on       = [module.terra_vpc.vpcid]
  vpc_id           = module.terra_vpc.vpcid
  aws_iam_role_arn = var.aws_iam_role_arn
  env              = var.env
  log_group_name   = var.log_group_name
}
