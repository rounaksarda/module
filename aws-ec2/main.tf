resource "aws_instance" "ec2" {

  ami           = var.ami
  instance_type = var.instance_type

  availability_zone = var.availability_zone
  subnet_id         = var.subnet_id 
  private_ip        = var.private_ip
  key_name          = var.key_name
  tenancy           = var.tenancy

  monitoring    = var.monitoring
  ebs_optimized = var.ebs_optimized
  hibernation   = var.hibernation

  source_dest_check    = var.source_dest_check
  iam_instance_profile = var.iam_instance_profile

  associate_public_ip_address = var.associate_public_ip_address

  vpc_security_group_ids = var.vpc_security_group_ids
  security_groups        = var.security_groups

  disable_api_termination = var.disable_api_termination
  disable_api_stop        = var.disable_api_stop

  user_data                   = var.user_data
  user_data_base64            = var.user_data_base64
  user_data_replace_on_change = var.user_data_replace_on_change

  ipv6_address_count    = var.ipv6_address_count
  ipv6_addresses        = var.ipv6_addresses
  secondary_private_ips = var.secondary_private_ips

  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior

  placement_group            = var.placement_group
  placement_group_id         = var.placement_group_id
  placement_partition_number = var.placement_partition_number

  host_id                 = var.host_id
  host_resource_group_arn = var.host_resource_group_arn

  tags        = var.tags
  volume_tags = var.volume_tags

  # ---------------------------
  # Metadata Options
  # ---------------------------
  dynamic "metadata_options" {
    for_each = var.metadata_options == null ? [] : [var.metadata_options]
    content {
      http_endpoint               = try(metadata_options.value.http_endpoint, "enabled")
      http_tokens                 = try(metadata_options.value.http_tokens, "required")
      http_put_response_hop_limit = try(metadata_options.value.http_put_response_hop_limit, 2)
      http_protocol_ipv6          = try(metadata_options.value.http_protocol_ipv6, "disabled")
      instance_metadata_tags      = try(metadata_options.value.instance_metadata_tags, "disabled")
    }
  }

  # ---------------------------
  # CPU Options
  # ---------------------------
  dynamic "cpu_options" {
    for_each = var.cpu_options == null ? [] : [var.cpu_options]
    content {
      core_count       = cpu_options.value.core_count
      threads_per_core = cpu_options.value.threads_per_core
      amd_sev_snp      = try(cpu_options.value.amd_sev_snp, null)
    }
  }

  # ---------------------------
  # Credit Specification
  # ---------------------------
  dynamic "credit_specification" {
    for_each = var.credit_specification == null ? [] : [var.credit_specification]
    content {
      cpu_credits = credit_specification.value.cpu_credits
    }
  }

  # ---------------------------
  # Market Options (Spot)
  # ---------------------------
  dynamic "instance_market_options" {
    for_each = var.instance_market_options == null ? [] : [var.instance_market_options]
    content {
      market_type = instance_market_options.value.market_type

      dynamic "spot_options" {
        for_each = try(instance_market_options.value.spot_options, null) == null ? [] : [instance_market_options.value.spot_options]
        content {
          instance_interruption_behavior = try(spot_options.value.instance_interruption_behavior, "terminate")
          max_price                      = try(spot_options.value.max_price, null)
          spot_instance_type             = try(spot_options.value.spot_instance_type, "one-time")
          valid_until                    = try(spot_options.value.valid_until, null)
        }
      }
    }
  }

  # ---------------------------
  # Root Block Device
  # ---------------------------
  dynamic "root_block_device" {
    for_each = var.root_block_device == null ? [] : [var.root_block_device]
    content {
      volume_size           = try(root_block_device.value.volume_size, 30)
      volume_type           = try(root_block_device.value.volume_type, "gp3")
      iops                  = try(root_block_device.value.iops, null)
      throughput            = try(root_block_device.value.throughput, null)
      encrypted             = try(root_block_device.value.encrypted, true)
      kms_key_id            = try(root_block_device.value.kms_key_id, null)
      delete_on_termination = try(root_block_device.value.delete_on_termination, true)
    }
  }

  # ---------------------------
  # Additional EBS Volumes
  # ---------------------------
  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device
    content {
      device_name           = ebs_block_device.value.device_name
      volume_size           = ebs_block_device.value.volume_size
      volume_type           = try(ebs_block_device.value.volume_type, "gp3")
      iops                  = try(ebs_block_device.value.iops, null)
      throughput            = try(ebs_block_device.value.throughput, null)
      encrypted             = try(ebs_block_device.value.encrypted, true)
      kms_key_id            = try(ebs_block_device.value.kms_key_id, null)
      snapshot_id           = try(ebs_block_device.value.snapshot_id, null)
      delete_on_termination = try(ebs_block_device.value.delete_on_termination, true)
    }
  }

  # ---------------------------
  # Launch Template
  # ---------------------------
  dynamic "launch_template" {
    for_each = var.launch_template == null ? [] : [var.launch_template]
    content {
      id      = try(launch_template.value.id, null)
      name    = try(launch_template.value.name, null)
      version = try(launch_template.value.version, "$Latest")
    }
  }
}



# resource "aws_instance" "ec2" {
#   for_each = var.instances

#   ami           = each.value.ami
#   instance_type = each.value.instance_type

#   availability_zone = try(each.value.availability_zone, null)
#   subnet_id         = try(each.value.subnet_id, null) 
#   private_ip        = try(each.value.private_ip, null)
#   key_name          = try(each.value.key_name, null)
#   tenancy           = try(each.value.tenancy, "default")

#   monitoring    = try(each.value.monitoring, false)
#   ebs_optimized = try(each.value.ebs_optimized, false)
#   hibernation   = try(each.value.hibernation, false)

#   source_dest_check    = try(each.value.source_dest_check, true)
#   iam_instance_profile = try(each.value.iam_instance_profile, null)

#   associate_public_ip_address =try(each.value.associate_public_ip_address, false)

#   vpc_security_group_ids = try(each.value.vpc_security_group_ids, null) 
#   security_groups        = try(each.value.security_groups, null)

#   disable_api_termination = try(each.value.disable_api_termination, false)
#   disable_api_stop        = try(each.value.disable_api_stop, false)

#   user_data                  = try(each.value.user_data, null)
#   user_data_base64            = try(each.value.user_data_base64, null)
#   user_data_replace_on_change = try(each.value.user_data_replace_on_change, false)

#   ipv6_address_count    = try(each.value.ipv6_address_count, null)
#   ipv6_addresses        = try(each.value.ipv6_addresses, null)
#   secondary_private_ips = try(each.value.secondary_private_ips, null)

#   instance_initiated_shutdown_behavior =try(each.value.instance_initiated_shutdown_behavior, "stop")

#   placement_group            = try(each.value.placement_group, null)
#   placement_group_id         = try(each.value.placement_group_id, null)
#   placement_partition_number = try(each.value.placement_partition_number, null)

#   host_id                 = try(each.value.host_id, null)
#   host_resource_group_arn = try(each.value.host_resource_group_arn, null)

#   tags        = try(each.value.tags, {})
#   volume_tags = try(each.value.volume_tags, {})

#   dynamic "metadata_options" {
#     for_each = try(each.value.metadata_options, null) == null ? [] : [each.value.metadata_options]
#     content {
#       http_endpoint               = try(metadata_options.value.http_endpoint, "enabled")
#       http_tokens                 = try(metadata_options.value.http_tokens, "required")
#       http_put_response_hop_limit = try(metadata_options.value.http_put_response_hop_limit, 2)
#       http_protocol_ipv6          = try(metadata_options.value.http_protocol_ipv6, "disabled")
#       instance_metadata_tags      = try(metadata_options.value.instance_metadata_tags, "disabled")
#     }
#   }

#   dynamic "cpu_options" {
#     for_each = try(each.value.cpu_options, null) == null ? [] : [each.value.cpu_options]
#     content {
#       core_count       = cpu_options.value.core_count
#       threads_per_core = cpu_options.value.threads_per_core
#       amd_sev_snp      = try(cpu_options.value.amd_sev_snp, null)
#     }
#   }

#   dynamic "credit_specification" {
#     for_each = try(each.value.credit_specification, null) == null ? [] : [each.value.credit_specification]
#     content {
#       cpu_credits = credit_specification.value.cpu_credits
#     }
#   }

#   dynamic "instance_market_options" {
#     for_each = try(each.value.instance_market_options, null) == null ? [] : [each.value.instance_market_options]
#     content {
#       market_type = instance_market_options.value.market_type

#       dynamic "spot_options" {
#         for_each = try(instance_market_options.value.spot_options, null) == null? []: [instance_market_options.value.spot_options]
#         content {
#           instance_interruption_behavior =try(spot_options.value.instance_interruption_behavior, "terminate")
#           max_price          = try(spot_options.value.max_price, null)
#           spot_instance_type = try(spot_options.value.spot_instance_type, "one-time")
#           valid_until        = try(spot_options.value.valid_until, null)
#         }
#       }
#     }
#   }


#   dynamic "root_block_device" {
#     for_each = try(each.value.root_block_device, null) == null ? [] : [each.value.root_block_device]
#     content {
#       volume_size           = try(root_block_device.value.volume_size, 30)
#       volume_type           = try(root_block_device.value.volume_type, "gp3")
#       iops                  = try(root_block_device.value.iops, null)
#       throughput            = try(root_block_device.value.throughput, null)
#       encrypted             = try(root_block_device.value.encrypted, true)
#       kms_key_id            = try(root_block_device.value.kms_key_id, null)
#       delete_on_termination = try(root_block_device.value.delete_on_termination, true)
#       #tags                  = try(root_block_device.value.tags, {})
#     }
#   }

#   dynamic "ebs_block_device" {
#     for_each = try(each.value.ebs_block_device, [])
#     content {
#       device_name           = ebs_block_device.value.device_name
#       volume_size           = ebs_block_device.value.volume_size
#       volume_type           = try(ebs_block_device.value.volume_type, "gp3")
#       iops                  = try(ebs_block_device.value.iops, null)
#       throughput            = try(ebs_block_device.value.throughput, null)
#       encrypted             = try(ebs_block_device.value.encrypted, true)
#       kms_key_id            = try(ebs_block_device.value.kms_key_id, null)
#       snapshot_id           = try(ebs_block_device.value.snapshot_id, null)
#       delete_on_termination = try(ebs_block_device.value.delete_on_termination, true)
#       #tags                  = try(ebs_block_device.value.tags, {})
#     }
#   }

#   dynamic "launch_template" {
#     for_each = try(each.value.launch_template, null) == null ? [] : [each.value.launch_template]
#     content {
#       id      = try(launch_template.value.id, null)
#       name    = try(launch_template.value.name, null)
#       version = try(launch_template.value.version, "$Latest")
#     }
#   }
# }
