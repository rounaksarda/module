output "log_group_name" {
  description = "Name of the CloudWatch log group"
  value       = aws_cloudwatch_log_group.aws_cloudwatch_log_group.name
}

output "log_group_arn" {
  description = "ARN of the CloudWatch log group"
  value       = aws_cloudwatch_log_group.aws_cloudwatch_log_group.arn
}

output "log_group_class" {
  description = "Class of the CloudWatch log group"
  value       = aws_cloudwatch_log_group.aws_cloudwatch_log_group.log_group_class
}