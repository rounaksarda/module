output "subscription_arn" {
  description = "ARN of the SNS subscription"
  value       = aws_sns_topic_subscription.aws_sns_topic_subscription.arn
}

output "pending_confirmation" {
  description = "Whether the subscription is pending confirmation"
  value       = aws_sns_topic_subscription.aws_sns_topic_subscription.pending_confirmation
}