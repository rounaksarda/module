resource "aws_networkfirewall_firewall" "firewall" {
  
  name                = var.name
  firewall_policy_arn = var.firewall_policy_arn

  description = try(var.description, null)

  vpc_id             = try(var.vpc_id, null)
  transit_gateway_id = try(var.transit_gateway_id, null)

  delete_protection                   = try(var.delete_protection, false)
  firewall_policy_change_protection   = try(var.firewall_policy_change_protection, false)
  subnet_change_protection            = try(var.subnet_change_protection, false)
  availability_zone_change_protection = try(var.availability_zone_change_protection, false)

  enabled_analysis_types = try(var.enabled_analysis_types, [])

  tags = try(var.tags, {})

  dynamic "subnet_mapping" {
    for_each = try(var.subnet_mapping, [])

    content {
      subnet_id = subnet_mapping.value.subnet_id

      ip_address_type = try(
        subnet_mapping.value.ip_address_type,
        null
      )
    }
  }

  dynamic "availability_zone_mapping" {
    for_each = try(var.availability_zone_mapping, [])

    content {
      availability_zone_id = availability_zone_mapping.value.availability_zone_id
    }
  }

 dynamic "encryption_configuration" {
  for_each = var.encryption_configuration == null ? [] : [var.encryption_configuration]

  content {
    type = encryption_configuration.value.type

    key_id = (
      encryption_configuration.value.type == "CUSTOMER_KMS"
      ? encryption_configuration.value.key_id
      : null
    )
  }
}
}
