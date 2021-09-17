Alibaba Cloud Kubernetes Networking Terraform Module
terraform-alicloud-kubernetes-networking
=====================================================================

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-kubernetes-networking/blob/master/README-CN.md)

Terraform module which create a networking environment for Kubernetes cluster on Alibaba Cloud.

These types of resources are supported:

* [VPC](https://www.terraform.io/docs/providers/alicloud/r/vpc.html)
* [VSwitch](https://www.terraform.io/docs/providers/alicloud/r/vswitch.html)
* [Nat Gateway](https://www.terraform.io/docs/providers/alicloud/r/nat_gateway.html)
* [Eip](https://www.terraform.io/docs/providers/alicloud/r/eip.html)
* [Eip Association](https://www.terraform.io/docs/providers/alicloud/r/eip_association.html)
* [Snat Entry](https://www.terraform.io/docs/providers/alicloud/r/snat_entry.html)


## Terraform versions

The Module requires Terraform 0.12 and Terraform Provider AliCloud 1.56.0+.

## Usage

```hcl
module "k8s_networking" {
  source             = "terraform-alicloud-modules/kubernetes-networking/alicloud"
  region             = "cn-beijing"
  profile            = "Your-Profile-Name"
  name               = "tf_k8s_networking"
  
  // You can specify an existing VPC ID to create the network
  // existing_vpc_id    = "vpc-2ze2w07mcyxxxxxx"
  vpc_cidr           = "10.1.0.0/21"
  availability_zones = ["cn-zhangjiakou-a", "cn-zhangjiakou-b", "cn-zhangjiakou-c"]
  vswitch_cidrs      = ["10.1.3.0/25", "10.1.4.0/25", "10.1.4.128/25"]
}

```

## Examples

* [Basic example](https://github.com/terraform-alicloud-modules/terraform-alicloud-kubernetes-networking/tree/master/examples/basic-example)

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`.
If you have not set them yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

Submit Issues
-------------
If you have any problems when using this module, please opening a [provider issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend to open an issue on this repo.

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)

