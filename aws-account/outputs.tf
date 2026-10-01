output "account_id" {
  description = "AWS Account ID"
  value       = aws_organizations_account.account.id
}

output "account_arn" {
  description = "AWS Account ARN"
  value       = aws_organizations_account.account.arn
}

output "account_name" {
  description = "AWS Account Name"
  value       = aws_organizations_account.account.name
}

output "govcloud_account_id" {
  description = "GovCloud Account ID (if created)"
  value       = aws_organizations_account.account.govcloud_id
}
