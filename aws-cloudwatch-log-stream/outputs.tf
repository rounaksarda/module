output "log_stream_name" {
  description = "Name of the CloudWatch log stream"
  value       = aws_cloudwatch_log_stream.aws_cloudwatch_log_stream.name
}

output "log_group_name" {
  description = "Log group associated with the log stream"
  value       = aws_cloudwatch_log_stream.aws_cloudwatch_log_stream.log_group_name
}