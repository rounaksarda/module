resource "aws_cloudwatch_log_subscription_filter" "aws_cloudwatch_log_subscription_filter" {
  name            = var.name
  log_group_name  = var.log_group_name
  filter_pattern  = var.filter_pattern
  destination_arn = var.destination_arn

  distribution               = try(var.distribution, null)
  role_arn                   = try(var.role_arn, null)
  apply_on_transformed_logs  = try(var.apply_on_transformed_logs, false)

  emit_system_fields = try(var.emit_system_fields, null)
}