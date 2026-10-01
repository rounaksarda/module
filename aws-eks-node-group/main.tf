resource "aws_eks_node_group" "aws_eks_node_group" {
  cluster_name    = var.cluster_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids

  node_group_name        = try(var.node_group_name, null)
  node_group_name_prefix = try(var.node_group_name_prefix, null)

  ami_type        = try(var.ami_type, null)
  capacity_type   = try(var.capacity_type, "ON_DEMAND")
  disk_size       = try(var.disk_size, null)
  instance_types  = try(var.instance_types, ["t3.medium"])
  release_version = try(var.release_version, null)
  version         = try(var.kubernetes_version, null)

  force_update_version = try(var.force_update_version, null)

  labels = try(var.labels, null)

  tags = merge(
    {
      ManagedBy = "terraform"
    },
    try(var.tags, {})
  )

  scaling_config {
    desired_size = var.scaling_config.desired_size
    max_size     = var.scaling_config.max_size
    min_size     = var.scaling_config.min_size
  }

  dynamic "update_config" {
    for_each = var.update_config != null ? [var.update_config] : []

    content {
      max_unavailable            = try(update_config.value.max_unavailable, null)
      max_unavailable_percentage = try(update_config.value.max_unavailable_percentage, null)
      update_strategy            = try(update_config.value.update_strategy, null)
    }
  }

  dynamic "remote_access" {
    for_each = var.remote_access != null ? [var.remote_access] : []

    content {
      ec2_ssh_key               = try(remote_access.value.ec2_ssh_key, null)
      source_security_group_ids = try(remote_access.value.source_security_group_ids, null)
    }
  }

  dynamic "launch_template" {
    for_each = var.launch_template != null ? [var.launch_template] : []

    content {
      id      = try(launch_template.value.id, null)
      name    = try(launch_template.value.name, null)
      version = launch_template.value.version
    }
  }

  dynamic "taint" {
    for_each = try(var.taints, [])

    content {
      key    = taint.value.key
      value  = try(taint.value.value, null)
      effect = taint.value.effect
    }
  }

  dynamic "node_repair_config" {
    for_each = var.node_repair_config != null ? [var.node_repair_config] : []

    content {
      enabled = try(node_repair_config.value.enabled, false)

      max_parallel_nodes_repaired_count = try(node_repair_config.value.max_parallel_nodes_repaired_count, null)
      max_parallel_nodes_repaired_percentage = try(node_repair_config.value.max_parallel_nodes_repaired_percentage, null)

      max_unhealthy_node_threshold_count = try(node_repair_config.value.max_unhealthy_node_threshold_count, null)
      max_unhealthy_node_threshold_percentage = try(node_repair_config.value.max_unhealthy_node_threshold_percentage, null)

      dynamic "node_repair_config_overrides" {
        for_each = try(node_repair_config.value.node_repair_config_overrides, [])

        content {
          min_repair_wait_time_mins = node_repair_config_overrides.value.min_repair_wait_time_mins
          node_monitoring_condition = node_repair_config_overrides.value.node_monitoring_condition
          node_unhealthy_reason     = node_repair_config_overrides.value.node_unhealthy_reason
          repair_action             = node_repair_config_overrides.value.repair_action
        }
      }
    }
  }
}