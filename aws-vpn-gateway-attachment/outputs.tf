output "id" {
  description = "ID of the VPN Gateway attachment."
  value       = aws_vpn_gateway_attachment.vpn_gateway_attachment.id
}

output "vpc_id" {
  description = "VPC ID associated with the VPN Gateway attachment."
  value       = aws_vpn_gateway_attachment.vpn_gateway_attachment.vpc_id
}

output "vpn_gateway_id" {
  description = "VPN Gateway ID associated with the attachment."
  value       = aws_vpn_gateway_attachment.vpn_gateway_attachment.vpn_gateway_id
}
