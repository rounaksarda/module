output "subscription_filter_name" {
  description = "Name of the CloudWatch Logs subscription filter"
  value       = aws_cloudwatch_log_subscription_filter.aws_cloudwatch_log_subscription_filter.name
}

output "log_group_name" {
  description = "Log group associated with the subscription filter"
  value       = aws_cloudwatch_log_subscription_filter.aws_cloudwatch_log_subscription_filter.log_group_name
}

output "destination_arn" {
  description = "Destination ARN receiving log events"
  value       = aws_cloudwatch_log_subscription_filter.aws_cloudwatch_log_subscription_filter.destination_arn
}