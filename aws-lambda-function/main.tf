resource "aws_lambda_function" "aws_lambda_function" {

  function_name = var.function_name
  role          = var.role

  package_type = try(var.package_type, "Zip")

  filename          = try(var.filename, null)
  image_uri         = try(var.image_uri, null)
  s3_bucket         = try(var.s3_bucket, null)
  s3_key            = try(var.s3_key, null)
  s3_object_version = try(var.s3_object_version, null)

  handler  = try(var.handler, null)
  runtime  = try(var.runtime, null)

  architectures = try(var.architectures, ["x86_64"])
  memory_size   = try(var.memory_size, 128)
  timeout       = try(var.timeout, 3)

  publish   = try(var.publish, false)
  layers    = try(var.layers, null)
  kms_key_arn         = try(var.kms_key_arn, null)
  source_kms_key_arn  = try(var.source_kms_key_arn, null)
  source_code_hash    = try(var.source_code_hash, null)
  code_sha256         = try(var.code_sha256, null)
  code_signing_config_arn = try(var.code_signing_config_arn, null)

  reserved_concurrent_executions = try(var.reserved_concurrent_executions, -1)

  description = try(var.description, null)
  skip_destroy = try(var.skip_destroy, false)

  dynamic "environment" {
    for_each = var.environment != null ? [1] : []
    content {
      variables = try(var.environment.variables, {})
    }
  }

  dynamic "dead_letter_config" {
    for_each = var.dead_letter_config != null ? [1] : []
    content {
      target_arn = var.dead_letter_config.target_arn
    }
  }

  dynamic "ephemeral_storage" {
    for_each = var.ephemeral_storage != null ? [1] : []
    content {
      size = var.ephemeral_storage.size
    }
  }

  dynamic "file_system_config" {
    for_each = var.file_system_config != null ? [1] : []
    content {
      arn              = var.file_system_config.arn
      local_mount_path = var.file_system_config.local_mount_path
    }
  }

  dynamic "image_config" {
    for_each = var.image_config != null ? [1] : []
    content {
      command           = try(var.image_config.command, null)
      entry_point       = try(var.image_config.entry_point, null)
      working_directory = try(var.image_config.working_directory, null)
    }
  }

  dynamic "logging_config" {
    for_each = var.logging_config != null ? [1] : []
    content {
      log_format            = var.logging_config.log_format
      application_log_level = try(var.logging_config.application_log_level, null)
      system_log_level      = try(var.logging_config.system_log_level, null)
      log_group             = try(var.logging_config.log_group, null)
    }
  }

  dynamic "snap_start" {
    for_each = var.snap_start != null ? [1] : []
    content {
      apply_on = var.snap_start.apply_on
    }
  }

  dynamic "tracing_config" {
    for_each = var.tracing_config != null ? [1] : []
    content {
      mode = var.tracing_config.mode
    }
  }

  dynamic "tenancy_config" {
    for_each = var.tenancy_config != null ? [1] : []
    content {
      tenant_isolation_mode = var.tenancy_config.tenant_isolation_mode
    }
  }

  dynamic "vpc_config" {
    for_each = var.vpc_config != null ? [1] : []
    content {
      subnet_ids                  = var.vpc_config.subnet_ids
      security_group_ids          = var.vpc_config.security_group_ids
      ipv6_allowed_for_dual_stack = try(var.vpc_config.ipv6_allowed_for_dual_stack, false)
    }
  }

  dynamic "capacity_provider_config" {
    for_each = var.capacity_provider_config != null ? [1] : []
    content {
      lambda_managed_instances_capacity_provider_config {
        capacity_provider_arn = var.capacity_provider_config.lambda_managed_instances_capacity_provider_config.capacity_provider_arn
        execution_environment_memory_gib_per_vcpu =try(var.capacity_provider_config.lambda_managed_instances_capacity_provider_config.execution_environment_memory_gib_per_vcpu, null)
        per_execution_environment_max_concurrency =try(var.capacity_provider_config.lambda_managed_instances_capacity_provider_config.per_execution_environment_max_concurrency, null)
      }
    }
  }

  tags = try(var.tags, {})
}