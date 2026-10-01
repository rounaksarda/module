resource "aws_cloudwatch_metric_alarm" "aws_cloudwatch_metric_alarm" {
  alarm_name          = var.alarm_name
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods

  metric_name         = try(length(var.metric_query) == 0 ? var.metric_name : null, null)
  namespace           = try(length(var.metric_query) == 0 ? var.namespace : null, null)
  period              = try(length(var.metric_query) == 0 ? var.period : null, null)
  statistic           = try(length(var.metric_query) == 0 ? var.statistic : null, null)
  extended_statistic  = try(length(var.metric_query) == 0 ? var.extended_statistic : null, null)
  dimensions          = try(length(var.metric_query) == 0 ? var.dimensions : null, null)
  unit                = try(length(var.metric_query) == 0 ? var.unit : null, null)

  threshold            = try(var.threshold, null)
  threshold_metric_id  = try(var.threshold_metric_id, null)

  actions_enabled             = try(var.actions_enabled, true)
  alarm_actions               = try(var.alarm_actions, [])
  ok_actions                  = try(var.ok_actions, [])
  insufficient_data_actions   = try(var.insufficient_data_actions, [])
  alarm_description           = try(var.alarm_description, null)
  datapoints_to_alarm         = try(var.datapoints_to_alarm, null)
  treat_missing_data          = try(var.treat_missing_data, "missing")
  evaluate_low_sample_count_percentiles = try(var.evaluate_low_sample_count_percentiles, null)

  tags = try(var.tags, {})

  dynamic "metric_query" {
    for_each = try(var.metric_query, [])
    content {
      id          = metric_query.value.id
      account_id = try(metric_query.value.account_id, null)
      expression = try(metric_query.value.expression, null)
      label      = try(metric_query.value.label, null)
      period     = try(metric_query.value.period, null)
      return_data = try(metric_query.value.return_data, null)

      dynamic "metric" {
        for_each = try(metric_query.value.metric != null ? [metric_query.value.metric] : [], [])
        content {
          metric_name = metric.value.metric_name
          namespace   = metric.value.namespace
          period      = metric.value.period
          stat        = metric.value.stat
          unit        = try(metric.value.unit, null)
          dimensions  = try(metric.value.dimensions, null)
        }
      }
    }
  }
}