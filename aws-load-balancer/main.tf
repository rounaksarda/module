resource "aws_lb" "lb" {

  name               = var.name
  name_prefix        = var.name_prefix
  load_balancer_type = var.load_balancer_type
  internal           = var.internal
  ip_address_type    = var.ip_address_type

  security_groups = var.load_balancer_type != "gateway" ? var.security_groups : null

  subnets = var.subnet_mapping == null ? var.subnets : null

  enable_deletion_protection                 = var.enable_deletion_protection
  enable_cross_zone_load_balancing           = var.enable_cross_zone_load_balancing
  enable_http2                               = var.load_balancer_type == "application" ? var.enable_http2 : null
  idle_timeout                               = var.load_balancer_type == "application" ? var.idle_timeout : null
  client_keep_alive                          = var.client_keep_alive
  customer_owned_ipv4_pool                   = var.customer_owned_ipv4_pool
  desync_mitigation_mode                     = var.desync_mitigation_mode
  dns_record_client_routing_policy           = var.load_balancer_type == "network" ? var.dns_record_client_routing_policy : null
  drop_invalid_header_fields                 = var.load_balancer_type == "application" ? var.drop_invalid_header_fields : null
  enable_tls_version_and_cipher_suite_headers = var.load_balancer_type == "application" ? var.enable_tls_version_and_cipher_suite_headers : null
  enable_xff_client_port                     = var.load_balancer_type == "application" ? var.enable_xff_client_port : null
  enable_waf_fail_open                       = var.enable_waf_fail_open
  enable_zonal_shift                         = var.enable_zonal_shift
  enforce_security_group_inbound_rules_on_private_link_traffic = var.load_balancer_type == "network" ? var.enforce_security_group_inbound_rules_on_private_link_traffic : null
  preserve_host_header                       = var.load_balancer_type == "application" ? var.preserve_host_header : null
  secondary_ips_auto_assigned_per_subnet     = var.load_balancer_type == "network" ? var.secondary_ips_auto_assigned_per_subnet : null
  xff_header_processing_mode                 = var.load_balancer_type == "application" ? var.xff_header_processing_mode : null

  tags = var.tags

  dynamic "access_logs" {
    for_each = var.access_logs == null ? [] : [var.access_logs]
    content {
      bucket  = access_logs.value.bucket
      enabled = access_logs.value.enabled
      prefix  = try(access_logs.value.prefix, null)
    }
  }

  dynamic "connection_logs" {
    for_each = var.connection_logs == null ? [] : [var.connection_logs]
    content {
      bucket  = connection_logs.value.bucket
      enabled = connection_logs.value.enabled
      prefix  = try(connection_logs.value.prefix, null)
    }
  }

  dynamic "health_check_logs" {
    for_each = var.health_check_logs == null ? [] : [var.health_check_logs]
    content {
      bucket  = health_check_logs.value.bucket
      enabled = health_check_logs.value.enabled
      prefix  = try(health_check_logs.value.prefix, null)
    }
  }

  dynamic "ipam_pools" {
    for_each = var.ipam_pools == null ? [] : [var.ipam_pools]
    content {
      ipv4_ipam_pool_id = ipam_pools.value.ipv4_ipam_pool_id
    }
  }

  dynamic "minimum_load_balancer_capacity" {
    for_each = var.minimum_load_balancer_capacity == null ? [] : [var.minimum_load_balancer_capacity]
    content {
      capacity_units = minimum_load_balancer_capacity.value.capacity_units
    }
  }

  dynamic "subnet_mapping" {
    for_each = var.subnet_mapping == null ? [] : var.subnet_mapping
    content {
      subnet_id            = subnet_mapping.value.subnet_id
      allocation_id        = try(subnet_mapping.value.allocation_id, null)
      ipv6_address         = try(subnet_mapping.value.ipv6_address, null)
      private_ipv4_address = try(subnet_mapping.value.private_ipv4_address, null)
    }
  }

  lifecycle {
    precondition {
      condition     = var.subnets != null || var.subnet_mapping != null
      error_message = "One of subnets or subnet_mapping must be provided."
    }
  }
}
