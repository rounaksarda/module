variable "region" {
  description = "Region where this resource will be managed."
  type        = string
  default     = null
}

variable "destination_cidr_block" {
  description = "IPv4 or IPv6 CIDR block for destination match."
  type        = string
}

variable "transit_gateway_route_table_id" {
  description = "Identifier of EC2 Transit Gateway Route Table."
  type        = string
}

variable "transit_gateway_attachment_id" {
  description = "Identifier of EC2 Transit Gateway Attachment (required if blackhole = false)."
  type        = string
  default     = null
}

variable "blackhole" {
  description = "Indicates whether to drop traffic that matches this route."
  type        = bool
  default     = false
}
