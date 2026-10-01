resource "aws_vpn_connection" "aws_vpn_connection" {

  customer_gateway_id = var.customer_gateway_id
  type                = var.type

  vpn_gateway_id    = var.vpn_gateway_id
  transit_gateway_id = var.transit_gateway_id
  vpn_concentrator_id = var.vpn_concentrator_id

  static_routes_only = var.static_routes_only
  enable_acceleration = var.enable_acceleration
  preshared_key_storage = var.preshared_key_storage

  local_ipv4_network_cidr  = var.local_ipv4_network_cidr
  local_ipv6_network_cidr  = var.local_ipv6_network_cidr
  remote_ipv4_network_cidr = var.remote_ipv4_network_cidr
  remote_ipv6_network_cidr = var.remote_ipv6_network_cidr

  outside_ip_address_type = var.outside_ip_address_type
  transport_transit_gateway_attachment_id = var.transport_transit_gateway_attachment_id

  tunnel_bandwidth          = var.tunnel_bandwidth
  tunnel_inside_ip_version  = var.tunnel_inside_ip_version

  tunnel1_inside_cidr       = var.tunnel1_inside_cidr
  tunnel2_inside_cidr       = var.tunnel2_inside_cidr
  tunnel1_inside_ipv6_cidr  = var.tunnel1_inside_ipv6_cidr
  tunnel2_inside_ipv6_cidr  = var.tunnel2_inside_ipv6_cidr

  tunnel1_preshared_key = var.tunnel1_preshared_key
  tunnel2_preshared_key = var.tunnel2_preshared_key

  tunnel1_dpd_timeout_action  = var.tunnel1_dpd_timeout_action
  tunnel2_dpd_timeout_action  = var.tunnel2_dpd_timeout_action
  tunnel1_dpd_timeout_seconds = var.tunnel1_dpd_timeout_seconds
  tunnel2_dpd_timeout_seconds = var.tunnel2_dpd_timeout_seconds

  tunnel1_enable_tunnel_lifecycle_control = var.tunnel1_enable_tunnel_lifecycle_control
  tunnel2_enable_tunnel_lifecycle_control = var.tunnel2_enable_tunnel_lifecycle_control

  tunnel1_ike_versions = var.tunnel1_ike_versions
  tunnel2_ike_versions = var.tunnel2_ike_versions

  tunnel1_phase1_dh_group_numbers = var.tunnel1_phase1_dh_group_numbers
  tunnel2_phase1_dh_group_numbers = var.tunnel2_phase1_dh_group_numbers
  tunnel1_phase1_encryption_algorithms = var.tunnel1_phase1_encryption_algorithms
  tunnel2_phase1_encryption_algorithms = var.tunnel2_phase1_encryption_algorithms
  tunnel1_phase1_integrity_algorithms  = var.tunnel1_phase1_integrity_algorithms
  tunnel2_phase1_integrity_algorithms  = var.tunnel2_phase1_integrity_algorithms
  tunnel1_phase1_lifetime_seconds      = var.tunnel1_phase1_lifetime_seconds
  tunnel2_phase1_lifetime_seconds      = var.tunnel2_phase1_lifetime_seconds

  tunnel1_phase2_dh_group_numbers = var.tunnel1_phase2_dh_group_numbers
  tunnel2_phase2_dh_group_numbers = var.tunnel2_phase2_dh_group_numbers
  tunnel1_phase2_encryption_algorithms = var.tunnel1_phase2_encryption_algorithms
  tunnel2_phase2_encryption_algorithms = var.tunnel2_phase2_encryption_algorithms
  tunnel1_phase2_integrity_algorithms  = var.tunnel1_phase2_integrity_algorithms
  tunnel2_phase2_integrity_algorithms  = var.tunnel2_phase2_integrity_algorithms
  tunnel1_phase2_lifetime_seconds      = var.tunnel1_phase2_lifetime_seconds
  tunnel2_phase2_lifetime_seconds      = var.tunnel2_phase2_lifetime_seconds

  tunnel1_rekey_fuzz_percentage        = var.tunnel1_rekey_fuzz_percentage
  tunnel2_rekey_fuzz_percentage        = var.tunnel2_rekey_fuzz_percentage
  tunnel1_rekey_margin_time_seconds    = var.tunnel1_rekey_margin_time_seconds
  tunnel2_rekey_margin_time_seconds    = var.tunnel2_rekey_margin_time_seconds
  tunnel1_replay_window_size           = var.tunnel1_replay_window_size
  tunnel2_replay_window_size           = var.tunnel2_replay_window_size
  tunnel1_startup_action               = var.tunnel1_startup_action
  tunnel2_startup_action               = var.tunnel2_startup_action

  dynamic "tunnel1_log_options" {
    for_each = var.tunnel1_log_options != null ? [1] : []
    content {
      cloudwatch_log_options {
        log_enabled           = lookup(var.tunnel1_log_options, "log_enabled", null)
        log_group_arn         = lookup(var.tunnel1_log_options, "log_group_arn", null)
        log_output_format     = lookup(var.tunnel1_log_options, "log_output_format", null)
        bgp_log_enabled       = lookup(var.tunnel1_log_options, "bgp_log_enabled", null)
        bgp_log_group_arn     = lookup(var.tunnel1_log_options, "bgp_log_group_arn", null)
        bgp_log_output_format = lookup(var.tunnel1_log_options, "bgp_log_output_format", null)
      }
    }
  }

  dynamic "tunnel2_log_options" {
    for_each = var.tunnel2_log_options != null ? [1] : []
    content {
      cloudwatch_log_options {
        log_enabled           = lookup(var.tunnel2_log_options, "log_enabled", null)
        log_group_arn         = lookup(var.tunnel2_log_options, "log_group_arn", null)
        log_output_format     = lookup(var.tunnel2_log_options, "log_output_format", null)
        bgp_log_enabled       = lookup(var.tunnel2_log_options, "bgp_log_enabled", null)
        bgp_log_group_arn     = lookup(var.tunnel2_log_options, "bgp_log_group_arn", null)
        bgp_log_output_format = lookup(var.tunnel2_log_options, "bgp_log_output_format", null)
      }
    }
  }

  tags = var.tags
}