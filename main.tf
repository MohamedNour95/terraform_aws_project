module "network" {
  source           = "./network"
  cidr             = var.cidr
  public_sub_cidr  = var.public_sub_cidr
  private_sub_cidr = var.private_sub_cidr
  region           = var.region
}