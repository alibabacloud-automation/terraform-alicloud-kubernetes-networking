variable "region" {
  description = "(Deprecated from version 1.2.0) The region used to launch this module resources."
  type        = string
  default     = ""
}

variable "profile" {
  description = "(Deprecated from version 1.2.0) The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  type        = string
  default     = ""
}
variable "shared_credentials_file" {
  description = "(Deprecated from version 1.2.0) This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  type        = string
  default     = ""
}

variable "skip_region_validation" {
  description = "(Deprecated from version 1.2.0) Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  type        = bool
  default     = false
}

variable "nat_instance_charge_type" {
  description = "(Deprecated from version 1.3.0) The charge type of the nat gateway. Choices are 'PostPaid' and 'PrePaid'."
  type        = string
  default     = "PostPaid"
}

variable "eip_instance_charge_type" {
  description = "(Deprecated from version 1.3.0) Elastic IP instance charge type."
  type        = string
  default     = "PostPaid"
}

# VPC variables
variable "create" {
  description = "Whether to create kubernetes networking resources."
  type        = bool
  default     = true
}

variable "existing_vpc_id" {
  description = "An existing vpc id used to create several vswitches and other resources."
  type        = string
  default     = ""
}

variable "vpc_name" {
  description = "The vpc name used to launch a new vpc."
  type        = string
  default     = ""
}

variable "vpc_cidr" {
  description = "The cidr block used to launch a new vpc when 'vpc_id' is not specified."
  type        = string
  default     = "10.1.0.0/21"
}

variable "vpc_tags" {
  description = "The tags used to launch a new vpc."
  type        = map(string)
  default     = {}
}

# VSwitch variables
variable "availability_zones" {
  description = "List available zones to launch several VSwitches."
  type        = list(string)
  default     = []
}

variable "vswitch_cidrs" {
  description = "List of cidr blocks used to create several new vswitches when 'vswitch_ids' is not specified."
  type        = list(string)
  default     = []
}

variable "vswitch_name" {
  description = "The name prefix used to launch the vswitch. "
  type        = string
  default     = ""
}

variable "vswitch_tags" {
  description = "The tags used to launch serveral vswitches."
  type        = map(string)
  default     = {}
}


// Nat gatway variables
variable "nat_gateway_name" {
  description = "The name prefix used to launch the nat gateway."
  type        = string
  default     = ""
}

variable "nat_specification" {
  description = "The specification of nat gateway."
  type        = string
  default     = "Small"
}

variable "nat_payment_type" {
  description = "The billing method of the NAT gateway."
  type        = string
  default     = "PayAsYouGo"
}

variable "nat_period" {
  description = "The charge duration of the PrePaid nat gateway, in month."
  type        = number
  default     = 1
}

variable "nat_internet_charge_type" {
  description = "The internet charge type. Valid values PayByLcu and PayBySpec."
  type        = string
  default     = "PayByLcu"
}

variable "nat_type" {
  description = "The type of NAT gateway."
  type        = string
  default     = "Enhanced"
}

// eip variables
variable "eip_name" {
  description = "The name prefix used to launch the eip. "
  type        = string
  default     = ""
}

variable "eip_bandwidth" {
  description = "The eip bandwidth."
  type        = number
  default     = 10
}

variable "eip_payment_type" {
  description = "The billing method of the NAT gateway."
  type        = string
  default     = "PayAsYouGo"
}

variable "eip_internet_charge_type" {
  description = "Internet charge type of the EIP, Valid values are `PayByBandwidth`, `PayByTraffic`. "
  type        = string
  default     = "PayByTraffic"
}

variable "eip_period" {
  description = "The duration that you will buy the EIP, in month."
  type        = number
  default     = 1
}

variable "eip_tags" {
  description = "The tags used to launch the eip."
  type        = map(string)
  default     = {}
}