output "id" {
  description = "IAM role policy ID."
  value       = aws_iam_role_policy.aws_iam_role_policy.id
}

output "name" {
  description = "IAM role policy name."
  value       = aws_iam_role_policy.aws_iam_role_policy.name
}

output "role" {
  description = "IAM role name the policy is attached to."
  value       = aws_iam_role_policy.aws_iam_role_policy.role
}
