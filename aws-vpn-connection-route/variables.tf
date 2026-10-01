variable "region" {
  description = "AWS region where the VPN connection route will be managed."
  type        = string
  default     = null
}

variable "vpn_connection_id" {
  description = "The ID of the VPN connection."
  type        = string
}

variable "destination_cidr_block" {
  description = "The CIDR block associated with the local subnet of the customer network."
  type        = string
}
