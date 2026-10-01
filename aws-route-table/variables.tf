variable "vpc_id" {
  description = "VPC ID where the route table will be created"
  type        = string
}

variable "region" {
  description = "Region where this route table is managed"
  type        = string
  default     = null
}

# variable "route_table_name" {
#   description = "Name tag for the route table"
#   type        = string
# }

variable "routes" {
  description = <<EOF
List of routes for the route table.
Exactly ONE destination and ONE target must be specified per route.
EOF

  type = list(object({
    cidr_block                 = optional(string)
    ipv6_cidr_block            = optional(string)
    destination_prefix_list_id = optional(string)

    carrier_gateway_id        = optional(string)
    core_network_arn          = optional(string)
    egress_only_gateway_id    = optional(string)
    gateway_id                = optional(string)
    local_gateway_id          = optional(string)
    nat_gateway_id            = optional(string)
    network_interface_id      = optional(string)
    transit_gateway_id        = optional(string)
    vpc_endpoint_id           = optional(string)
    vpc_peering_connection_id = optional(string)
  }))

  default = []
}

variable "propagating_vgws" {
  description = "List of virtual gateways for route propagation"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Additional tags to assign to the route table"
  type        = map(string)
  default     = {}
}
