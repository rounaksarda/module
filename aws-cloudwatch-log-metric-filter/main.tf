resource "aws_cloudwatch_log_metric_filter" "aws_cloudwatch_log_metric_filter" {
  name           = var.name
  pattern        = var.pattern
  log_group_name = var.log_group_name

  apply_on_transformed_logs = try(var.apply_on_transformed_logs, false)

  metric_transformation {
    name      = var.metric_transformation.name
    namespace = var.metric_transformation.namespace
    value     = var.metric_transformation.value

    # These two are mutually exclusive (AWS-enforced)
    default_value = try(var.metric_transformation.default_value, null)
    dimensions    = try(var.metric_transformation.dimensions, null)

    unit = try(var.metric_transformation.unit, null)
  }
}