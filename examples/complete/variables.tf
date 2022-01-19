# VPC variables
variable "vpc_name" {
  description = "The vpc name used to launch a new vpc."
  type        = string
  default     = "tf-k8s-networking-vpc"
}

variable "vpc_tags" {
  description = "The tags used to launch a new vpc."
  type        = map(string)
  default = {
    Name = "Vpc"
  }
}

# VSwitch variables
variable "vswitch_name" {
  description = "The name prefix used to launch the vswitch. "
  type        = string
  default     = "tf-k8s-networking-vsw"
}

variable "vswitch_tags" {
  description = "The tags used to launch serveral vswitches."
  type        = map(string)
  default = {
    Name = "Vswitch"
  }
}

// Nat gatway variables
variable "nat_gateway_name" {
  description = "The name prefix used to launch the nat gateway. "
  type        = string
  default     = "tf-k8s-networking-nat"
}

variable "nat_specification" {
  description = "The specification of nat gateway."
  type        = string
  default     = "Small"
}

variable "nat_period" {
  description = "The charge duration of the PrePaid nat gateway, in month."
  type        = number
  default     = 1
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
  default     = "tf-k8s-networking-eip"
}

variable "eip_bandwidth" {
  description = "The eip bandwidth."
  type        = number
  default     = 10
}

variable "eip_period" {
  description = "The duration that you will buy the EIP, in month."
  type        = number
  default     = 1
}

variable "eip_tags" {
  description = "The tags used to launch the eip."
  type        = map(string)
  default = {
    Name = "Eip"
  }
}