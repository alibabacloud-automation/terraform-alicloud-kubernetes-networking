locals {
  vpc_name         = var.vpc_name == "" ? "tf-k8s-networking-module-vpc" : var.vpc_name
  vswitch_name     = var.vswitch_name == "" ? "tf-k8s-networking-module-vsw" : var.vswitch_name
  nat_gateway_name = var.nat_gateway_name == "" ? "tf-k8s-networking-module-nat" : var.nat_gateway_name
  eip_name         = var.eip_name == "" ? "tf-k8s-networking-module-eip" : var.eip_name
}

// If there is not specifying vpc_id, the module will launch a new vpc
module "vpc" {
  source             = "alibaba/vpc/alicloud"
  create             = var.create
  vpc_id             = var.existing_vpc_id
  vpc_name           = local.vpc_name
  vpc_cidr           = var.vpc_cidr
  vpc_tags           = var.vpc_tags
  availability_zones = var.availability_zones
  vswitch_cidrs      = var.vswitch_cidrs
  vswitch_name       = local.vswitch_name
  vswitch_tags       = var.vswitch_tags
}

resource "alicloud_nat_gateway" "this" {
  count                = var.create ? 1 : 0
  vpc_id               = module.vpc.this_vpc_id
  vswitch_id           = module.vpc.this_vswitch_ids[0]
  nat_gateway_name     = local.nat_gateway_name
  specification        = var.nat_specification
  payment_type         = var.nat_payment_type != "" ? var.nat_payment_type : var.nat_instance_charge_type == "PostPaid" ? "PayAsYouGo" : "Subscription"
  period               = var.nat_period
  internet_charge_type = var.nat_internet_charge_type
  nat_type             = var.nat_type
}

resource "alicloud_eip" "this" {
  count                = var.create ? 1 : 0
  address_name         = local.eip_name
  bandwidth            = var.eip_bandwidth
  payment_type         = var.eip_payment_type != "" ? var.eip_payment_type : var.eip_instance_charge_type == "PostPaid" ? "PayAsYouGo" : "Subscription"
  internet_charge_type = var.eip_internet_charge_type
  period               = var.eip_period
  tags = merge(
    {
      Name = local.eip_name
    },
    var.eip_tags,
  )
}

resource "alicloud_eip_association" "this" {
  count         = var.create ? 1 : 0
  allocation_id = concat(alicloud_eip.this.*.id, [""])[0]
  instance_id   = concat(alicloud_nat_gateway.this.*.id, [""])[0]
}

resource "alicloud_snat_entry" "this" {
  count             = var.create ? length(var.vswitch_cidrs) : 0
  snat_table_id     = concat(alicloud_nat_gateway.this.*.snat_table_ids, [""])[0]
  source_vswitch_id = length(var.vswitch_cidrs) > 0 ? concat([module.vpc.this_vswitch_ids[count.index]], [""])[0] : ""
  snat_ip           = concat(alicloud_eip.this.*.ip_address, [""])[0]
  depends_on        = [alicloud_eip_association.this]
}