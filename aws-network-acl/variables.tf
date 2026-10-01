variable "vpc_id" {
  description = "VPC ID where the Network ACL is created"
  type        = string
}

variable "region" {
  description = "Region where this resource is managed"
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "List of subnet IDs to associate with the Network ACL"
  type        = list(string)
  default     = []
}

variable "network_acl_name" {
  description = "Name tag for the Network ACL"
  type        = string
}


variable "ingress_rules" {
  description = <<EOF
Ingress rules for the Network ACL.
Rules are evaluated in ascending order of rule_no.
EOF

  type = list(object({
    rule_no  = number
    action   = string   # allow | deny
    protocol = string   # tcp | udp | icmp | -1

    from_port = number
    to_port   = number

    cidr_block      = optional(string)
    ipv6_cidr_block = optional(string)

    icmp_type = optional(number, 0)
    icmp_code = optional(number, 0)
  }))

  default = []
}

variable "egress_rules" {
  description = <<EOF
Egress rules for the Network ACL.
Rules are evaluated in ascending order of rule_no.
EOF

  type = list(object({
    rule_no  = number
    action   = string
    protocol = string

    from_port = number
    to_port   = number

    cidr_block      = optional(string)
    ipv6_cidr_block = optional(string)

    icmp_type = optional(number, 0)
    icmp_code = optional(number, 0)
  }))

  default = []
}

variable "tags" {
  description = "Additional tags to assign to the Network ACL"
  type        = map(string)
  default     = {}
}
