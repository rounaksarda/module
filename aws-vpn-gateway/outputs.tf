output "id" {
  description = "ID of the VPN Gateway."
  value       = aws_vpn_gateway.vpn_gateway.id
}

output "arn" {
  description = "ARN of the VPN Gateway."
  value       = aws_vpn_gateway.vpn_gateway.arn
}

output "amazon_side_asn" {
  description = "Amazon-side ASN of the VPN Gateway."
  value       = aws_vpn_gateway.vpn_gateway.amazon_side_asn
}

output "availability_zone" {
  description = "Availability Zone of the VPN Gateway."
  value       = aws_vpn_gateway.vpn_gateway.availability_zone
}

output "vpc_id" {
  description = "VPC ID the VPN Gateway is attached to."
  value       = aws_vpn_gateway.vpn_gateway.vpc_id
}
