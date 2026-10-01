variable "region" {
  description = "Region where the VPN Gateway attachment will be managed. Defaults to provider region."
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "vpn_gateway_id" {
  description = "The ID of the Virtual Private Gateway."
  type        = string
}
