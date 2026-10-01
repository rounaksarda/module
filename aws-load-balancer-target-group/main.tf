resource "aws_lb_target_group" "lb_target_group" {

  name        = var.name
  name_prefix = var.name_prefix
  port        = var.port
  protocol    = var.protocol
  protocol_version = var.protocol_version
  vpc_id      = var.vpc_id
  target_type = var.target_type
  ip_address_type = var.ip_address_type

  connection_termination              = var.connection_termination
  deregistration_delay                = var.deregistration_delay
  lambda_multi_value_headers_enabled  = var.lambda_multi_value_headers_enabled
  load_balancing_algorithm_type       = var.load_balancing_algorithm_type
  load_balancing_anomaly_mitigation   = var.load_balancing_anomaly_mitigation
  load_balancing_cross_zone_enabled   = var.load_balancing_cross_zone_enabled
  preserve_client_ip                  = var.preserve_client_ip
  proxy_protocol_v2                   = var.proxy_protocol_v2
  slow_start                          = var.slow_start

  tags = var.tags

  dynamic "health_check" {
    for_each = var.health_check != null ? [var.health_check] : []
    content {
      enabled             = try(health_check.value.enabled, true)
      healthy_threshold   = try(health_check.value.healthy_threshold, 3)
      unhealthy_threshold = try(health_check.value.unhealthy_threshold, 3)
      interval            = try(health_check.value.interval, 30)
      timeout             = try(health_check.value.timeout, null)
      protocol            = try(health_check.value.protocol, null)
      path                = try(health_check.value.path, null)
      port                = try(health_check.value.port, "traffic-port")
      matcher             = try(health_check.value.matcher, null)
    }
  }

  dynamic "stickiness" {
    for_each = var.stickiness != null ? [var.stickiness] : []
    content {
      enabled         = try(stickiness.value.enabled, true)
      type            = stickiness.value.type
      cookie_duration = try(stickiness.value.cookie_duration, 86400)
      cookie_name     = try(stickiness.value.cookie_name, null)
    }
  }

  dynamic "target_failover" {
    for_each = var.target_failover != null ? [var.target_failover] : []
    content {
      on_deregistration = try(target_failover.value.on_deregistration, "no_rebalance")
      on_unhealthy      = try(target_failover.value.on_unhealthy, "no_rebalance")
    }
  }

  dynamic "target_health_state" {
    for_each = var.target_health_state != null ? [var.target_health_state] : []
    content {
      enable_unhealthy_connection_termination = try(target_health_state.value.enable_unhealthy_connection_termination, true)

      unhealthy_draining_interval = try(target_health_state.value.unhealthy_draining_interval, 0)
    }
  }

  dynamic "target_group_health" {
    for_each = var.target_group_health != null ? [var.target_group_health] : []
    content {

      dynamic "dns_failover" { 
        for_each = try(target_group_health.value.dns_failover, null) != null ? [target_group_health.value.dns_failover] : []
        content {
          minimum_healthy_targets_count = try(dns_failover.value.minimum_healthy_targets_count, null)

          minimum_healthy_targets_percentage = try(dns_failover.value.minimum_healthy_targets_percentage, null)
        }
      }

      dynamic "unhealthy_state_routing" {
        for_each = try(target_group_health.value.unhealthy_state_routing, null) != null ? [target_group_health.value.unhealthy_state_routing] : []
        content {
          minimum_healthy_targets_count = try(unhealthy_state_routing.value.minimum_healthy_targets_count, 1)

          minimum_healthy_targets_percentage = try(unhealthy_state_routing.value.minimum_healthy_targets_percentage, null)
        }
      }
    }
  }
}
