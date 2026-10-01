variable "region" {
  description = "Region where this resource will be managed"
  type        = string
  default     = null
}

variable "transit_gateway_id" {
  description = "Identifier of EC2 Transit Gateway"
  type        = string
}

variable "tags" {
  description = "Tags for the Transit Gateway Route Table"
  type        = map(string)
  default     = {}
}
