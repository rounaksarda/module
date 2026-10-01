output "fqdn" {
  description = "Fully qualified domain name"
  value       = aws_route53_record.aws_route53_record.fqdn
}

output "record_name" {
  description = "Record name"
  value       = aws_route53_record.aws_route53_record.name
}

output "record_type" {
  description = "Record type"
  value       = aws_route53_record.aws_route53_record.type
}
