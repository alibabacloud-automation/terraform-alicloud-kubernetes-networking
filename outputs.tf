output "this_vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.this_vpc_id
}

output "this_vpc_name" {
  description = "The name of the VPC."
  value       = module.vpc.this_vpc_name
}

output "this_vpc_tags" {
  description = "The tags of the VPC."
  value       = module.vpc.this_vpc_tags
}

output "this_vpc_cidr_block" {
  description = "The cidr block of the VPC."
  value       = module.vpc.this_vpc_cidr_block
}

output "this_vswitch_ids" {
  description = "List ID of the VSwitches."
  value       = module.vpc.this_vswitch_ids
}

output "this_vswitch_names" {
  description = "List name of the VSwitches."
  value       = module.vpc.this_vswitch_names
}

output "this_vswitch_tags" {
  description = "The tags of the VSwitches."
  value       = module.vpc.this_vswitch_tags
}

output "this_vswitch_cidr_blocks" {
  description = "The tags of the VSwitches."
  value       = module.vpc.this_vswitch_cidr_blocks
}

output "this_nat_gateway_id" {
  description = "The ID of the nat gateway."
  value       = concat(alicloud_nat_gateway.this.*.id, [""])[0]
}

output "this_nat_gateway_name" {
  description = "The name of the nat gateway."
  value       = concat(alicloud_nat_gateway.this.*.nat_gateway_name, [""])[0]
}
output "this_nat_gateway_spec" {
  description = "The nat gateway spec."
  value       = concat(alicloud_nat_gateway.this.*.spec, [""])[0]
}

output "this_eip_id" {
  description = "The id of new eip."
  value       = concat(alicloud_eip.this.*.id, [""])[0]
}

output "this_eip_name" {
  description = "The name of new eip."
  value       = concat(alicloud_eip.this.*.name, [""])[0]
}

output "this_eip_ip" {
  description = "The ip address of new eip."
  value       = concat(alicloud_eip.this.*.ip_address, [""])[0]
}

output "this_eip_tags" {
  description = "The tags of new eip."
  value       = concat(alicloud_eip.this.*.tags, [{}])[0]
}