output "topic_arn" {
  description = "ARN of the SNS topic"
  value       = aws_sns_topic.aws_sns_topic.arn
}

output "topic_name" {
  description = "Name of the SNS topic"
  value       = aws_sns_topic.aws_sns_topic.name
}

output "topic_id" {
  description = "ID of the SNS topic"
  value       = aws_sns_topic.aws_sns_topic.id
}