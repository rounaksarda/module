variable "route_table_id" {
  description = "The ID of the route table to associate with."
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to associate with the route table. Conflicts with gateway_id."
  type        = string
  default     = null
}

variable "gateway_id" {
  description = "The gateway ID (e.g., Internet Gateway or Virtual Private Gateway) to associate with the route table. Conflicts with subnet_id."
  type        = string
  default     = null
}

# variable "association_type_validation" {
#   description = "Internal validation variable. Do not set."
#   type        = bool
#   default     = true

#   validation {
#     condition = (
#       (var.subnet_id != null && var.gateway_id == null) ||
#       (var.subnet_id == null && var.gateway_id != null)
#     )
#     error_message = "Exactly one of subnet_id or gateway_id must be provided."
#   }
# }
