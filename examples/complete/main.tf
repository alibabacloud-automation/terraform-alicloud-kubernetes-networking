data "alicloud_zones" "default" {
}

// kubernetes networking Module
module "k8s_networking" {
  source = "../../"

  #vpc
  create = true

  vpc_name           = var.vpc_name
  vpc_cidr           = "172.16.0.0/16"
  vpc_tags           = var.vpc_tags
  availability_zones = data.alicloud_zones.default.ids
  vswitch_cidrs      = ["172.16.0.0/21"]
  vswitch_name       = var.vswitch_name
  vswitch_tags       = var.vswitch_tags

  #alicloud_nat_gateway
  nat_gateway_name         = var.nat_gateway_name
  nat_specification        = var.nat_specification
  nat_payment_type         = "PayAsYouGo"
  nat_period               = var.nat_period
  nat_internet_charge_type = "PayByLcu"
  nat_type                 = var.nat_type

  #alicloud_eip
  eip_name                 = var.eip_name
  eip_bandwidth            = var.eip_bandwidth
  eip_payment_type         = "PayAsYouGo"
  eip_internet_charge_type = "PayByBandwidth"
  eip_period               = var.eip_period
  eip_tags                 = var.eip_tags

}