#vpc
vpc_name = "update-tf-k8s-networking-vpc"
vpc_tags = {
  Name = "UpdateVpc"
}
vswitch_name = "update-tf-k8s-networking-vsw"
vswitch_tags = {
  Name = "UpdateVswitch"
}

#alicloud_nat_gateway
nat_gateway_name  = "update-tf-k8s-networking-nat"
nat_specification = "Middle"
nat_period        = "2"

#alicloud_eip
eip_name      = "update-tf-k8s-networking-eip"
eip_bandwidth = 20
eip_period    = 2
eip_tags = {
  Name = "UpdateEip"
}