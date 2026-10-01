variable "vpc_id" {
  description = "VPC ID where subnet will be created"
  type        = string
}

variable "region" {
  description = "Region where this subnet is managed"
  type        = string
  default     = null
}

variable "availability_zone" {
  description = "Availability Zone name"
  type        = string
  default     = null
}

variable "availability_zone_id" {
  description = "Availability Zone ID"
  type        = string
  default     = null
}

variable "cidr_block" {
  description = "IPv4 CIDR block for the subnet"
  type        = string
  default     = null
}

variable "map_public_ip_on_launch" {
  description = "Assign public IP to instances launched in subnet"
  type        = bool
  default     = false
}

variable "customer_owned_ipv4_pool" {
  description = "Customer owned IPv4 pool (Outposts only)"
  type        = string
  default     = null
}

variable "map_customer_owned_ip_on_launch" {
  description = "Assign customer owned IP on instance launch"
  type        = bool
  default     = false
}

variable "outpost_arn" {
  description = "Outpost ARN"
  type        = string
  default     = null
}

variable "ipv6_cidr_block" {
  description = "IPv6 CIDR block (/64)"
  type        = string
  default     = null
}

variable "ipv6_native" {
  description = "Create IPv6-only subnet"
  type        = bool
  default     = false
}

variable "assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on ENI creation"
  type        = bool
  default     = false
}

variable "enable_dns64" {
  description = "Enable DNS64 for IPv6 subnet"
  type        = bool
  default     = false
}

variable "enable_resource_name_dns_a_record_on_launch" {
  description = "Enable DNS A record for instance hostname"
  type        = bool
  default     = false
}

variable "enable_resource_name_dns_aaaa_record_on_launch" {
  description = "Enable DNS AAAA record for instance hostname"
  type        = bool
  default     = false
}

# variable "private_dns_hostname_type_on_launch" {
#   description = "Hostname type: ip-name or resource-name"
#   type        = string
#   default     = null

#   validation {
#     condition     = var.private_dns_hostname_type_on_launch == null || contains(["ip-name", "resource-name"], var.private_dns_hostname_type_on_launch)
#     error_message = "private_dns_hostname_type_on_launch must be ip-name or resource-name"
#   }
# }
variable "private_dns_hostname_type_on_launch" {
  description = "Hostname type: ip-name or resource-name"
  type        = string
  default     = null
  nullable    = true

  validation {
    condition = var.private_dns_hostname_type_on_launch == null ? true : contains(
      ["ip-name", "resource-name"],
      var.private_dns_hostname_type_on_launch
    )

    error_message = "private_dns_hostname_type_on_launch must be ip-name or resource-name."
  }
}

variable "enable_lni_at_device_index" {
  description = "Local Network Interface device index"
  type        = number
  default     = null
}

# variable "subnet_name" {
#   description = "Name tag for the subnet"
#   type        = string
# }

variable "tags" {
  description = "Additional resource tags"
  type        = map(string)
  default     = {}
}
