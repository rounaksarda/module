resource "aws_security_group" "sg" {

  name        = var.name
  name_prefix = var.name_prefix

  description = var.description

  vpc_id = var.vpc_id

  region = var.region

  revoke_rules_on_delete = var.revoke_rules_on_delete

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol

      cidr_blocks       = ingress.value.cidr_blocks
      ipv6_cidr_blocks  = ingress.value.ipv6_cidr_blocks
      prefix_list_ids   = ingress.value.prefix_list_ids
      security_groups   = ingress.value.security_groups
      self              = ingress.value.self
      description       = ingress.value.description
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol

      cidr_blocks       = egress.value.cidr_blocks
      ipv6_cidr_blocks  = egress.value.ipv6_cidr_blocks
      prefix_list_ids   = egress.value.prefix_list_ids
      security_groups   = egress.value.security_groups
      self              = egress.value.self
      description       = egress.value.description
    }
  }

  tags = merge(
    {
      Name = coalesce(var.name, var.name_prefix)
    },
    var.tags
  )
}
