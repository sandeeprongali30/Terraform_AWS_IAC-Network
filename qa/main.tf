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
  private_rt_id        = module.nat.private_rt_id
  public_rt_id         = module.igw.public_rt_id
}

module "flowlogs" {
  source           = "../modules/flowlogs"
  depends_on       = [module.terra_vpc.vpcid]
  vpc_id           = module.terra_vpc.vpcid
  env              = var.env
  log_group_name   = var.log_group_name
  aws_iam_role_arn = var.aws_iam_role_arn
}

module "nat" {
  source              = "../modules/nat"
  depends_on          = [module.terra_vpc.vpcid]
  vpc_id              = module.terra_vpc.vpcid
  vpc_name            = var.vpc_name
  public_subnets_cidr = var.public_subnets_cidr
  env                 = var.env
  public_subnet_id    = module.subnets.PublicSubnet-1
}

module "igw" {
  source     = "../modules/igw"
  depends_on = [module.terra_vpc.vpcid]
  vpc_id     = module.terra_vpc.vpcid
  vpc_name   = var.vpc_name
  env        = var.env
}
