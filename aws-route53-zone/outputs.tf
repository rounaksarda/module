output "zone_id" {
  description = "Route53 hosted zone ID"
  value       = aws_route53_zone.aws_route53_zone.zone_id
}

output "zone_arn" {
  description = "Route53 hosted zone ARN"
  value       = aws_route53_zone.aws_route53_zone.arn
}

output "name_servers" {
  description = "Authoritative name servers (public zones only)"
  value       = aws_route53_zone.aws_route53_zone.name_servers
}

output "is_private_zone" {
  description = "Whether aws_route53_zone is a private hosted zone"
  value       = length(var.vpcs) > 0
}
