resource "aws_eks_cluster" "aws_eks_cluster" {
  name     = var.name
  role_arn = var.role_arn
  version  = try(var.cluster_version, null)

  vpc_config {
    subnet_ids              = var.vpc_config.subnet_ids
    endpoint_private_access = try(var.vpc_config.endpoint_private_access, false)
    endpoint_public_access  = try(var.vpc_config.endpoint_public_access, true)
    public_access_cidrs     = try(var.vpc_config.public_access_cidrs, null)
    security_group_ids      = try(var.vpc_config.security_group_ids, null)
  }

  dynamic "access_config" {
    for_each = var.access_config != null ? [var.access_config] : []
    content {
      authentication_mode                         = try(access_config.value.authentication_mode, null)
      bootstrap_cluster_creator_admin_permissions = try(access_config.value.bootstrap_cluster_creator_admin_permissions, true)
    }
  }

  dynamic "compute_config" {
    for_each = var.compute_config != null ? [var.compute_config] : []
    content {
      enabled       = try(compute_config.value.enabled, null)
      node_pools    = try(compute_config.value.node_pools, null)
      node_role_arn = try(compute_config.value.node_role_arn, null)
    }
  }

  dynamic "control_plane_scaling_config" {
    for_each = var.control_plane_scaling_config != null ? [var.control_plane_scaling_config] : []
    content {
      tier = try(control_plane_scaling_config.value.tier, "standard")
    }
  }

  dynamic "encryption_config" {
    for_each = var.encryption_config != null ? var.encryption_config : []
    content {
      resources = encryption_config.value.resources

      provider {
        key_arn = encryption_config.value.provider.key_arn
      }
    }
  }

  dynamic "kubernetes_network_config" {
    for_each = var.kubernetes_network_config != null ? [var.kubernetes_network_config] : []
    content {
      service_ipv4_cidr = try(kubernetes_network_config.value.service_ipv4_cidr, null)
      ip_family         = try(kubernetes_network_config.value.ip_family, null)

      dynamic "elastic_load_balancing" {
        for_each = try(kubernetes_network_config.value.elastic_load_balancing != null ? [kubernetes_network_config.value.elastic_load_balancing] : [], [])
        content {
          enabled = try(elastic_load_balancing.value.enabled, null)
        }
      }
    }
  }

  dynamic "remote_network_config" {
    for_each = var.remote_network_config != null ? [var.remote_network_config] : []
    content {

      dynamic "remote_node_networks" {
        for_each = try(remote_network_config.value.remote_node_networks != null ? [remote_network_config.value.remote_node_networks] : [], [])
        content {
          cidrs = remote_node_networks.value.cidrs
        }
      }

      dynamic "remote_pod_networks" {
        for_each = try(remote_network_config.value.remote_pod_networks != null ? [remote_network_config.value.remote_pod_networks] : [], [])
        content {
          cidrs = remote_pod_networks.value.cidrs
        }
      }
    }
  }

  dynamic "storage_config" {
    for_each = var.storage_config != null ? [var.storage_config] : []
    content {
      dynamic "block_storage" {
        for_each = try(storage_config.value.block_storage != null ? [storage_config.value.block_storage] : [], [])
        content {
          enabled = try(block_storage.value.enabled, null)
        }
      }
    }
  }

  dynamic "upgrade_policy" {
    for_each = var.upgrade_policy != null ? [var.upgrade_policy] : []
    content {
      support_type = try(upgrade_policy.value.support_type, null)
    }
  }

  dynamic "zonal_shift_config" {
    for_each = var.zonal_shift_config != null ? [var.zonal_shift_config] : []
    content {
      enabled = try(zonal_shift_config.value.enabled, null)
    }
  }

  enabled_cluster_log_types = try(var.enabled_cluster_log_types, null)
  deletion_protection       = try(var.deletion_protection, false)
  bootstrap_self_managed_addons = try(var.bootstrap_self_managed_addons, true)
  force_update_version      = try(var.force_update_version, null)

  tags = try(var.tags, {})
}