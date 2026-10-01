variable "region" {
  description = "Region where the endpoint is managed (handled by provider)"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "VPC ID where the endpoint will be created"
  type        = string
}

variable "vpc_endpoint_type" {
  description = "VPC endpoint type"
  type        = string
  default     = "Gateway"

  validation {
    condition = contains(
      ["Gateway", "Interface", "GatewayLoadBalancer", "Resource", "ServiceNetwork"],
      var.vpc_endpoint_type
    )
    error_message = "Invalid vpc_endpoint_type."
  }
}

variable "service_name" {
  type        = string
  default     = null
}

variable "service_network_arn" {
  type        = string
  default     = null
}

variable "resource_configuration_arn" {
  type        = string
  default     = null
}

variable "service_region" {
  type        = string
  default     = null
}

variable "auto_accept" {
  type        = bool
  default     = false
}

variable "policy" {
  description = "IAM policy JSON for the endpoint"
  type        = string
  default     = null
}

variable "private_dns_enabled" {
  type        = bool
  default     = false
}

variable "ip_address_type" {
  type        = string
  default     = "ipv4"

  # validation {
  #   condition     = contains(["ipv4", "dualstack", "ipv6"], var.ip_address_type)
  #   error_message = "ip_address_type must be ipv4, dualstack, or ipv6."
  # }
}

variable "route_table_ids" {
  type        = list(string)
  default     = null
}

variable "subnet_ids" {
  type        = list(string)
  default     = null
}

variable "security_group_ids" {
  type        = list(string)
  default     = null
}

variable "dns_options" {
  type = object({
    dns_record_ip_type = optional(string)
    private_dns_only_for_inbound_resolver_endpoint = optional(bool)
    private_dns_preference = optional(string)
    private_dns_specified_domains = optional(list(string))
  })
  default = null
}

variable "subnet_configuration" {
  type = list(object({
    subnet_id = optional(string)
    ipv4      = optional(string)
    ipv6      = optional(string)
  }))
  default = null
}

variable "tags" {
  type        = map(string)
  default     = {}
}
