output "metric_filter_name" {
  description = "Name of the CloudWatch log metric filter"
  value       = aws_cloudwatch_log_metric_filter.aws_cloudwatch_log_metric_filter.name
}

output "log_group_name" {
  description = "Log group associated with the metric filter"
  value       = aws_cloudwatch_log_metric_filter.aws_cloudwatch_log_metric_filter.log_group_name
}

output "metric_name" {
  description = "CloudWatch metric name emitted by the filter"
  value       = aws_cloudwatch_log_metric_filter.aws_cloudwatch_log_metric_filter.metric_transformation[0].name
}

output "metric_namespace" {
  description = "CloudWatch metric namespace emitted by the filter"
  value       = aws_cloudwatch_log_metric_filter.aws_cloudwatch_log_metric_filter.metric_transformation[0].namespace
}