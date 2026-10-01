variable "region" {
  description = "Region where the VPN Gateway will be created. Defaults to provider region."
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "The VPC ID to attach the VPN Gateway to."
  type        = string
  default     = null
}

variable "availability_zone" {
  description = "Availability Zone for the VPN Gateway."
  type        = string
  default     = null
}

variable "amazon_side_asn" {
  description = "Amazon-side ASN for the VPN Gateway."
  type        = number
  default     = null
}

variable "tags" {
  description = "Tags to apply to the VPN Gateway."
  type        = map(string)
  default     = {}
}
