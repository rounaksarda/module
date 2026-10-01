resource "aws_vpc_endpoint" "endpoint" {

  vpc_id            = var.vpc_id
  vpc_endpoint_type = var.vpc_endpoint_type

  service_name                = var.service_name
  service_region              = var.service_region
  service_network_arn         = var.service_network_arn
  resource_configuration_arn  = var.resource_configuration_arn

  auto_accept          = var.auto_accept
  policy               = var.policy
  private_dns_enabled  = var.private_dns_enabled
  ip_address_type      = var.ip_address_type

  route_table_ids     = var.route_table_ids
  subnet_ids          = var.subnet_ids
  security_group_ids  = var.security_group_ids

  dynamic "dns_options" {
  for_each = var.dns_options == null ? {} : { "dns" = var.dns_options }

  content {
    dns_record_ip_type = lookup(each.value, "dns_record_ip_type", null)

    private_dns_only_for_inbound_resolver_endpoint = lookup(each.value, "private_dns_only_for_inbound_resolver_endpoint", null)

    private_dns_preference = lookup(each.value, "private_dns_preference", null)

    private_dns_specified_domains = lookup(each.value, "private_dns_specified_domains", null)
  }
}

  # dynamic "dns_options" {
  #   for_each = var.dns_options != null ? [var.dns_options] : []
  #   content {
  #     dns_record_ip_type = lookup(dns_options.value, "dns_record_ip_type", null)

  #     private_dns_only_for_inbound_resolver_endpoint = lookup(dns_options.value, "private_dns_only_for_inbound_resolver_endpoint", null)

  #     private_dns_preference = lookup(dns_options.value, "private_dns_preference", null)

  #     private_dns_specified_domains = lookup(dns_options.value, "private_dns_specified_domains", null)
  #   }
  # }

  dynamic "subnet_configuration" {
    for_each = var.subnet_configuration != null ? var.subnet_configuration : []
    content {
      subnet_id = lookup(subnet_configuration.value, "subnet_id", null)
      ipv4      = lookup(subnet_configuration.value, "ipv4", null)
      ipv6      = lookup(subnet_configuration.value, "ipv6", null)
    }
  }

  tags = var.tags
}
