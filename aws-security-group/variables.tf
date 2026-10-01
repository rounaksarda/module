variable "name" {
  description = "Name of the security group (conflicts with name_prefix)"
  type        = string
  default     = null
}

variable "name_prefix" {
  description = "Name prefix for the security group (conflicts with name)"
  type        = string
  default     = null
}

variable "description" {
  description = "Security group description"
  type        = string
  default     = "Managed by Terraform"
}

variable "vpc_id" {
  description = "VPC ID where the security group is created"
  type        = string
  default     = null
}

variable "region" {
  description = "Region where this resource will be managed"
  type        = string
  default     = null
}

variable "revoke_rules_on_delete" {
  description = "Revoke rules before deleting security group"
  type        = bool
  default     = false
}

variable "ingress_rules" {
  description = <<EOF
Ingress rules for the security group.
Each rule must include:
- from_port
- to_port
- protocol
And at least one of:
- cidr_blocks
- ipv6_cidr_blocks
- prefix_list_ids
- security_groups
- self
EOF

  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string

    cidr_blocks      = optional(list(string))
    ipv6_cidr_blocks = optional(list(string))
    prefix_list_ids  = optional(list(string))
    security_groups  = optional(list(string))
    self             = optional(bool)
    description      = optional(string)
  }))

  default = []
}

variable "egress_rules" {
  description = <<EOF
Egress rules for the security group.
Each rule must include:
- from_port
- to_port
- protocol
And at least one of:
- cidr_blocks
- ipv6_cidr_blocks
- prefix_list_ids
- security_groups
- self
EOF

  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string

    cidr_blocks      = optional(list(string))
    ipv6_cidr_blocks = optional(list(string))
    prefix_list_ids  = optional(list(string))
    security_groups  = optional(list(string))
    self             = optional(bool)
    description      = optional(string)
  }))

  default = []
}

variable "tags" {
  description = "Additional tags to assign"
  type        = map(string)
  default     = {}
}
