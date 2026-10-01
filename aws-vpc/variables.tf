variable "region" {
  description = "Region where the VPC will be managed (handled by provider)"
  type        = string
  default     = null
}

variable "cidr_block" {
  description = "IPv4 CIDR block for the VPC"
  type        = string
  default     = null
}

variable "instance_tenancy" {
  description = "Instance tenancy option for the VPC"
  type        = string
  default     = "default"

  validation {
    condition     = contains(["default", "dedicated"], var.instance_tenancy)
    error_message = "instance_tenancy must be 'default' or 'dedicated'."
  }
}

# ---------- IPv4 IPAM ----------
variable "ipv4_ipam_pool_id" {
  description = "IPv4 IPAM pool ID"
  type        = string
  default     = null
}

variable "ipv4_netmask_length" {
  description = "Netmask length for IPv4 CIDR allocation from IPAM"
  type        = number
  default     = null
}

# ---------- IPv6 ----------
variable "assign_generated_ipv6_cidr_block" {
  description = "Request an Amazon-provided IPv6 CIDR block (/56)"
  type        = bool
  default     = false
}

variable "ipv6_cidr_block" {
  description = "Explicit IPv6 CIDR block"
  type        = string
  default     = null
}

variable "ipv6_ipam_pool_id" {
  description = "IPv6 IPAM pool ID"
  type        = string
  default     = null
}

variable "ipv6_netmask_length" {
  description = "IPv6 netmask length from IPAM"
  type        = number
  default     = null

  validation {
    condition = var.ipv6_netmask_length == null ? true : (
      var.ipv6_netmask_length >= 44 &&
      var.ipv6_netmask_length <= 60 &&
      var.ipv6_netmask_length % 4 == 0
    )

    error_message = "ipv6_netmask_length must be between 44 and 60 in increments of 4."
  }
}

variable "ipv6_cidr_block_network_border_group" {
  description = "Network border group for IPv6 CIDR advertisement"
  type        = string
  default     = null
}

# ---------- DNS & Metrics ----------
variable "enable_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = false
}

variable "enable_network_address_usage_metrics" {
  description = "Enable network address usage metrics"
  type        = bool
  default     = false
}

# ---------- Tags ----------
variable "tags" {
  description = "Tags to apply to the VPC"
  type        = map(string)
  default     = {}
}
