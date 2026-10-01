output "id" {
  description = "IAM role policy attachment ID."
  value       = aws_iam_role_policy_attachment.aws_iam_role_policy_attachment.id
}

output "role" {
  description = "IAM role name."
  value       = aws_iam_role_policy_attachment.aws_iam_role_policy_attachment.role
}

output "policy_arn" {
  description = "Attached policy ARN."
  value       = aws_iam_role_policy_attachment.aws_iam_role_policy_attachment.policy_arn
}
