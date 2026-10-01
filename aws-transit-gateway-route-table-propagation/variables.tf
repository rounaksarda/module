variable "region" {
  description = "AWS region for this resource. Must match the provider region used by the caller."
  type        = string
  default     = null
}

variable "transit_gateway_attachment_id" {
  description = "Identifier of the EC2 Transit Gateway Attachment."
  type        = string
}

variable "transit_gateway_route_table_id" {
  description = "Identifier of the EC2 Transit Gateway Route Table."
  type        = string
}
