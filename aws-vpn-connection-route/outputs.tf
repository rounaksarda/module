output "id" {
  description = "ID of the VPN connection route."
  value       = aws_vpn_connection_route.aws_vpn_connection_route.id
}

output "vpn_connection_id" {
  description = "VPN connection ID associated with the route."
  value       = aws_vpn_connection_route.aws_vpn_connection_route.vpn_connection_id
}

output "destination_cidr_block" {
  description = "Destination CIDR block for the VPN connection route."
  value       = aws_vpn_connection_route.aws_vpn_connection_route.destination_cidr_block
}
