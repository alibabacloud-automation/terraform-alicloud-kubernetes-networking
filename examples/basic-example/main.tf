variable "profile" {
  default = "default"
}
variable "region" {
  default = "cn-zhangjiakou"
}

variable "vpc_cidr" {
  default = "10.1.0.0/21"
}

variable "availability_zones" {
  default = ["cn-zhangjiakou-a", "cn-zhangjiakou-b", "cn-zhangjiakou-c"]
}

provider "alicloud" {
  region  = var.region
  profile = var.profile
}

// kubernetes networking Module
module "k8s_networking" {
  source             = "../../"
  region             = var.region
  profile            = var.profile
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  vswitch_cidrs      = [cidrsubnet(var.vpc_cidr, 4, 6), cidrsubnet(var.vpc_cidr, 4, 8), cidrsubnet(var.vpc_cidr, 4, 9)]
}

