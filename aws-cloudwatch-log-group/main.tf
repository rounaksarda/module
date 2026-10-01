resource "aws_cloudwatch_log_group" "aws_cloudwatch_log_group" {
  name        = try(var.name, null)
  name_prefix = try(var.name == null ? var.name_prefix : null, null)

  skip_destroy                  = try(var.skip_destroy, false)
  deletion_protection_enabled   = try(var.deletion_protection_enabled, false)
  log_group_class               = try(var.log_group_class, null)

  retention_in_days = try(var.retention_in_days, null)

  kms_key_id = try(var.kms_key_id, null)

  tags = try(var.tags, {})
}