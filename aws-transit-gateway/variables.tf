variable "region" {
  description = "Region where this resource will be managed"
  type        = string
  default     = null
}

variable "amazon_side_asn" {
  description = "Private ASN for Amazon side of BGP session"
  type        = number
  default     = 64512

  validation {
    condition = (
      (var.amazon_side_asn >= 64512 && var.amazon_side_asn <= 65534) ||
      (var.amazon_side_asn >= 4200000000 && var.amazon_side_asn <= 4294967294)
    )
    error_message = "ASN must be within valid 16-bit or 32-bit private range."
  }
}

variable "auto_accept_shared_attachments" {
  type        = string
  default     = "disable"
  validation {
    condition     = contains(["enable", "disable"], var.auto_accept_shared_attachments)
    error_message = "Valid values: enable or disable."
  }
}

variable "default_route_table_association" {
  type    = string
  default = "enable"
}

variable "default_route_table_propagation" {
  type    = string
  default = "enable"
}

variable "description" {
  type    = string
  default = null
}

variable "dns_support" {
  type    = string
  default = "enable"
}

variable "encryption_support" {
  type    = string
  default = "disable"
}

variable "security_group_referencing_support" {
  type    = string
  default = "disable"
}

variable "multicast_support" {
  type    = string
  default = "disable"
}

variable "transit_gateway_cidr_blocks" {
  description = "List of IPv4 or IPv6 CIDR blocks"
  type        = list(string)
  default     = []
}

variable "vpn_ecmp_support" {
  type    = string
  default = "enable"
}

variable "tags" {
  description = "Tags to apply to the Transit Gateway"
  type        = map(string)
  default     = {}
}
