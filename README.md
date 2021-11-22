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


## Usage

```hcl
module "k8s_networking" {
  source             = "terraform-alicloud-modules/kubernetes-networking/alicloud"
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
From the version v1.2.0, the module has removed the following `provider` setting:

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/kubernetes-networking"
}
```

If you still want to use the `provider` setting to apply this module, you can specify a supported version, like 1.1.0:

```hcl
module "k8s_networking" {
  source   = "terraform-alicloud-modules/kubernetes-networking/alicloud"
  version  = "1.1.0"
  region   = "cn-beijing"
  profile  = "Your-Profile-Name"
  name     = "tf_k8s_networking"
  vpc_cidr = "10.1.0.0/21"
  // ...
}
```

If you want to upgrade the module to 1.2.0 or higher in-place, you can define a provider which same region with
previous region:

```hcl
provider "alicloud" {
  region  = "cn-beijing"
  profile = "Your-Profile-Name"
}
module "k8s_networking" {
  source   = "terraform-alicloud-modules/kubernetes-networking/alicloud"
  name     = "tf_k8s_networking"
  vpc_cidr = "10.1.0.0/21"
  // ...
}
```
or specify an alias provider with a defined region to the module using `providers`:

```hcl
provider "alicloud" {
  region  = "cn-beijing"
  profile = "Your-Profile-Name"
  alias   = "bj"
}
module "k8s_networking" {
  source    = "terraform-alicloud-modules/kubernetes-networking/alicloud"
  providers = {
    alicloud = alicloud.bj
  }
  name      = "tf_k8s_networking"
  vpc_cidr  = "10.1.0.0/21"
  // ...
}
```

and then run `terraform init` and `terraform apply` to make the defined provider effect to the existing module state.

More details see [How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Terraform versions

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0 |

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

