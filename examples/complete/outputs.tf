output "this_vpc_id" {
  description = "The ID of the VPC."
  value       = module.k8s_networking.this_vpc_id
}

output "this_vpc_tags" {
  description = "The tags of the VPC."
  value       = module.k8s_networking.this_vpc_tags
}

output "this_vswitch_tags" {
  description = "The tags of the VSwitches."
  value       = module.k8s_networking.this_vswitch_tags
}

output "this_vswitch_cidr_blocks" {
  description = "The tags of the VSwitches."
  value       = module.k8s_networking.this_vswitch_cidr_blocks
}

output "this_nat_gateway_id" {
  description = "The ID of the nat gateway."
  value       = module.k8s_networking.this_nat_gateway_id
}

output "this_nat_gateway_name" {
  description = "The name of the nat gateway."
  value       = module.k8s_networking.this_nat_gateway_name
}
output "this_nat_gateway_spec" {
  description = "The nat gateway spec."
  value       = module.k8s_networking.this_nat_gateway_spec
}

output "this_eip_id" {
  description = "The id of new eip."
  value       = module.k8s_networking.this_eip_id
}

output "this_eip_name" {
  description = "The name of new eip."
  value       = module.k8s_networking.this_eip_name
}

output "this_eip_ip" {
  description = "The ip address of new eip."
  value       = module.k8s_networking.this_eip_ip
}

output "this_eip_tags" {
  description = "The tags of new eip."
  value       = module.k8s_networking.this_eip_tags
}