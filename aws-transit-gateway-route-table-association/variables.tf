variable "region" {
  description = "Region where this resource will be managed."
  type        = string
  default     = null
}

variable "transit_gateway_attachment_id" {
  description = "Identifier of EC2 Transit Gateway Attachment."
  type        = string
}

variable "transit_gateway_route_table_id" {
  description = "Identifier of EC2 Transit Gateway Route Table."
  type        = string
}

variable "replace_existing_association" {
  description = "Whether to replace existing association before associating."
  type        = bool
  default     = false
}
