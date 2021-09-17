Alibaba Cloud Kubernetes Networking Terraform Module
terraform-alicloud-kubernetes-networking
=====================================================================

本 Module 用于在阿里云创建一套 Kubernetes 集群适用的网络环境相关资源. 

本 Module 支持创建以下资源:

* [VPC](https://www.terraform.io/docs/providers/alicloud/r/vpc.html)
* [VSwitch](https://www.terraform.io/docs/providers/alicloud/r/vswitch.html)
* [Nat Gateway](https://www.terraform.io/docs/providers/alicloud/r/nat_gateway.html)
* [Eip](https://www.terraform.io/docs/providers/alicloud/r/eip.html)
* [Eip Association](https://www.terraform.io/docs/providers/alicloud/r/eip_association.html)
* [Snat Entry](https://www.terraform.io/docs/providers/alicloud/r/snat_entry.html)


## Terraform 版本

本 Module 要求使用 Terraform 0.12 和 阿里云 Provider 1.56.0+。

## 用法

```hcl
module "k8s_networking" {
  source             = "terraform-alicloud-modules/kubernetes-networking/alicloud"
  region             = "cn-beijing"
  profile            = "Your-Profile-Name"
  name               = "tf_k8s_networking"
  
  // 您可以指定现有vpc来创建网络环境
  // existing_vpc_id   = "vpc-2ze2w07mcyxxxxxx"
  vpc_cidr           = "10.1.0.0/21"
  availability_zones = ["cn-zhangjiakou-a", "cn-zhangjiakou-b", "cn-zhangjiakou-c"]
  vswitch_cidrs      = ["10.1.3.0/25", "10.1.4.0/25", "10.1.4.128/25"]
}

```

## 示例

* [基础示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-kubernetes-networking/tree/master/examples/basic-example)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file` 中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置.

提交问题
-------
如果在使用该 Terraform Module 的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

作者
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)