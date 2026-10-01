variable "region" {
  description = "Region override"
  type        = string
  default     = null
}

variable "name" {
  type    = string
  default = null
}

variable "name_prefix" {
  type    = string
  default = null
}

variable "load_balancer_type" {
  type        = string
  default     = "application"
  validation {
    condition     = contains(["application", "network", "gateway"], var.load_balancer_type)
    error_message = "load_balancer_type must be application, network, or gateway."
  }
}

variable "internal" {
  type    = bool
  default = false
}

variable "ip_address_type" {
  type    = string
  default = "ipv4"
}

variable "security_groups" {
  type    = list(string)
  default = null
}

variable "subnets" {
  type    = list(string)
  default = null
}

variable "subnet_mapping" {
  type = list(object({
    subnet_id            = string
    allocation_id        = optional(string)
    ipv6_address         = optional(string)
    private_ipv4_address = optional(string)
  }))
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "enable_cross_zone_load_balancing" {
  type    = bool
  default = null
}

variable "enable_deletion_protection" {
  type    = bool
  default = false
}

variable "enable_http2" {
  type    = bool
  default = true
}

variable "idle_timeout" {
  type    = number
  default = 60
}

variable "client_keep_alive" {
  type    = number
  default = null
}

variable "customer_owned_ipv4_pool" {
  type    = string
  default = null
}

variable "desync_mitigation_mode" {
  type    = string
  default = null
}

variable "dns_record_client_routing_policy" {
  type    = string
  default = null
}

variable "drop_invalid_header_fields" {
  type    = bool
  default = false
}

variable "enable_tls_version_and_cipher_suite_headers" {
  type    = bool
  default = false
}

variable "enable_xff_client_port" {
  type    = bool
  default = false
}

variable "enable_waf_fail_open" {
  type    = bool
  default = false
}

variable "enable_zonal_shift" {
  type    = bool
  default = false
}

variable "enforce_security_group_inbound_rules_on_private_link_traffic" {
  type    = string
  default = null
}

variable "preserve_host_header" {
  type    = bool
  default = false
}

variable "secondary_ips_auto_assigned_per_subnet" {
  type    = number
  default = 0
}

variable "xff_header_processing_mode" {
  type    = string
  default = "append"
}

variable "ipam_pools" {
  type = object({
    ipv4_ipam_pool_id = string
  })
  default = null
}

variable "minimum_load_balancer_capacity" {
  type = object({
    capacity_units = number
  })
  default = null
}

variable "access_logs" {
  type = object({
    bucket  = string
    enabled = optional(bool, false)
    prefix  = optional(string)
  })
  default = null
}

variable "connection_logs" {
  type = object({
    bucket  = string
    enabled = optional(bool, false)
    prefix  = optional(string)
  })
  default = null
}

variable "health_check_logs" {
  type = object({
    bucket  = string
    enabled = optional(bool, false)
    prefix  = optional(string)
  })
  default = null
}
