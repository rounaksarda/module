variable "region" {
  description = "Region where this resource will be managed"
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "Identifiers of EC2 Subnets"
  type        = list(string)
}

variable "transit_gateway_id" {
  description = "Identifier of EC2 Transit Gateway"
  type        = string
}

variable "vpc_id" {
  description = "Identifier of EC2 VPC"
  type        = string
}

variable "appliance_mode_support" {
  description = "Enable Appliance Mode"
  type        = string
  default     = "disable"

  validation {
    condition     = contains(["enable", "disable"], var.appliance_mode_support)
    error_message = "Valid values: enable or disable."
  }
}

variable "dns_support" {
  description = "Enable DNS support"
  type        = string
  default     = "enable"

  validation {
    condition     = contains(["enable", "disable"], var.dns_support)
    error_message = "Valid values: enable or disable."
  }
}

variable "ipv6_support" {
  description = "Enable IPv6 support"
  type        = string
  default     = "disable"

  validation {
    condition     = contains(["enable", "disable"], var.ipv6_support)
    error_message = "Valid values: enable or disable."
  }
}

variable "security_group_referencing_support" {
  description = "Enable Security Group Referencing Support"
  type        = string
  default     = null
}

variable "transit_gateway_default_route_table_association" {
  description = "Manage default TGW route table association"
  type        = bool
  default     = true
}

variable "transit_gateway_default_route_table_propagation" {
  description = "Manage default TGW route table propagation"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags for the TGW attachment"
  type        = map(string)
  default     = {}
}
