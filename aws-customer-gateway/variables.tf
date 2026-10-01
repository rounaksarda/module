variable "region" {
  description = "Region where the Customer Gateway will be managed. Defaults to provider region."
  type        = string
  default     = null
}

variable "type" {
  description = "The type of customer gateway. The only supported value is ipsec.1."
  type        = string

  validation {
    condition     = var.type == "ipsec.1"
    error_message = "Customer Gateway type must be 'ipsec.1'."
  }
}

variable "ip_address" {
  description = "The IPv4 address for the customer gateway device's outside interface."
  type        = string
  default     = null
}

variable "bgp_asn" {
  description = "BGP ASN (1–2147483647). Conflicts with bgp_asn_extended."
  type        = number
  default     = null
}

variable "bgp_asn_extended" {
  description = "Extended BGP ASN (2147483648–4294967295). Conflicts with bgp_asn."
  type        = number
  default     = null
}

variable "certificate_arn" {
  description = "ARN of the customer gateway certificate."
  type        = string
  default     = null
}

variable "device_name" {
  description = "A name for the customer gateway device."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to the customer gateway."
  type        = map(string)
  default     = {}
}

variable "_bgp_asn_conflict_guard" {
  description = "Internal validation guard for BGP ASN conflicts"
  type        = bool
  default     = true

  # validation {
  #   condition = var._bgp_asn_conflict_guard && !(
  #     var.bgp_asn != null && var.bgp_asn_extended != null
  #   )
  #   error_message = "Only one of bgp_asn or bgp_asn_extended may be specified."
  # }
}

