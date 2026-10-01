variable "region" {
  description = "AWS region where the VPN connection will be created."
  type        = string
  default     = null
}

variable "customer_gateway_id" {
  description = "The ID of the customer gateway."
  type        = string
}

variable "type" {
  description = "The type of VPN connection. AWS currently supports only ipsec.1."
  type        = string

  validation {
    condition     = var.type == "ipsec.1"
    error_message = "VPN connection type must be ipsec.1"
  }
}

variable "vpn_gateway_id" {
  description = "The ID of the Virtual Private Gateway."
  type        = string
  default     = null
}

variable "transit_gateway_id" {
  description = "The ID of the Transit Gateway."
  type        = string
  default     = null
}

variable "vpn_concentrator_id" {
  description = "The ID of the VPN concentrator."
  type        = string
  default     = null
}

variable "static_routes_only" {
  description = "Whether the VPN connection uses static routes only."
  type        = bool
  default     = false
}

variable "enable_acceleration" {
  description = "Enable acceleration for the VPN connection (TGW only)."
  type        = bool
  default     = false
}

variable "preshared_key_storage" {
  description = "Storage mode for the preshared key."
  type        = string
  default     = null
}

variable "local_ipv4_network_cidr" {
  description = "IPv4 CIDR on the customer gateway side."
  type        = string
  default     = null
}

variable "local_ipv6_network_cidr" {
  description = "IPv6 CIDR on the customer gateway side."
  type        = string
  default     = null
}

variable "remote_ipv4_network_cidr" {
  description = "IPv4 CIDR on the AWS side."
  type        = string
  default     = null
}

variable "remote_ipv6_network_cidr" {
  description = "IPv6 CIDR on the AWS side."
  type        = string
  default     = null
}

variable "outside_ip_address_type" {
  description = "Public or Private IP address type."
  type        = string
  default     = null
}

variable "transport_transit_gateway_attachment_id" {
  description = "Transit Gateway attachment ID for PrivateIpv4 VPNs."
  type        = string
  default     = null
}

variable "tunnel_bandwidth" {
  description = "Tunnel bandwidth (standard or large)."
  type        = string
  default     = null
}

variable "tunnel_inside_ip_version" {
  description = "IP version used inside the VPN tunnels."
  type        = string
  default     = null
}

variable "tunnel1_inside_cidr" {
  type    = string
  default = null
}

variable "tunnel2_inside_cidr" {
  type    = string
  default = null
}

variable "tunnel1_inside_ipv6_cidr" {
  type    = string
  default = null
}

variable "tunnel2_inside_ipv6_cidr" {
  type    = string
  default = null
}

variable "tunnel1_preshared_key" {
  type    = string
  default = null
}

variable "tunnel2_preshared_key" {
  type    = string
  default = null
}

variable "tunnel1_dpd_timeout_action" {
  type    = string
  default = null
}

variable "tunnel2_dpd_timeout_action" {
  type    = string
  default = null
}

variable "tunnel1_dpd_timeout_seconds" {
  type    = number
  default = null
}

variable "tunnel2_dpd_timeout_seconds" {
  type    = number
  default = null
}

variable "tunnel1_enable_tunnel_lifecycle_control" {
  type    = bool
  default = false
}

variable "tunnel2_enable_tunnel_lifecycle_control" {
  type    = bool
  default = false
}

variable "tunnel1_ike_versions" {
  type    = list(string)
  default = null
}

variable "tunnel2_ike_versions" {
  type    = list(string)
  default = null
}

############################
# Phase 1 Parameters
############################
variable "tunnel1_phase1_dh_group_numbers" {
  type    = list(number)
  default = null
}

variable "tunnel2_phase1_dh_group_numbers" {
  type    = list(number)
  default = null
}

variable "tunnel1_phase1_encryption_algorithms" {
  type    = list(string)
  default = null
}

variable "tunnel2_phase1_encryption_algorithms" {
  type    = list(string)
  default = null
}

variable "tunnel1_phase1_integrity_algorithms" {
  type    = list(string)
  default = null
}

variable "tunnel2_phase1_integrity_algorithms" {
  type    = list(string)
  default = null
}

variable "tunnel1_phase1_lifetime_seconds" {
  type    = number
  default = null
}

variable "tunnel2_phase1_lifetime_seconds" {
  type    = number
  default = null
}

variable "tunnel1_phase2_dh_group_numbers" {
  type    = list(number)
  default = null
}

variable "tunnel2_phase2_dh_group_numbers" {
  type    = list(number)
  default = null
}

variable "tunnel1_phase2_encryption_algorithms" {
  type    = list(string)
  default = null
}

variable "tunnel2_phase2_encryption_algorithms" {
  type    = list(string)
  default = null
}

variable "tunnel1_phase2_integrity_algorithms" {
  type    = list(string)
  default = null
}

variable "tunnel2_phase2_integrity_algorithms" {
  type    = list(string)
  default = null
}

variable "tunnel1_phase2_lifetime_seconds" {
  type    = number
  default = null
}

variable "tunnel2_phase2_lifetime_seconds" {
  type    = number
  default = null
}

variable "tunnel1_rekey_fuzz_percentage" {
  type    = number
  default = null
}

variable "tunnel2_rekey_fuzz_percentage" {
  type    = number
  default = null
}

variable "tunnel1_rekey_margin_time_seconds" {
  type    = number
  default = null
}

variable "tunnel2_rekey_margin_time_seconds" {
  type    = number
  default = null
}

variable "tunnel1_replay_window_size" {
  type    = number
  default = null
}

variable "tunnel2_replay_window_size" {
  type    = number
  default = null
}

variable "tunnel1_startup_action" {
  type    = string
  default = null
}

variable "tunnel2_startup_action" {
  type    = string
  default = null
}

variable "tunnel1_log_options" {
  description = "Logging options for tunnel 1."
  type        = map(any)
  default     = null
}

variable "tunnel2_log_options" {
  description = "Logging options for tunnel 2."
  type        = map(any)
  default     = null
}

variable "tags" {
  description = "Tags to apply to the VPN connection."
  type        = map(string)
  default     = {}
}
