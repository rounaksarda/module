output "route_table_id" {
  description = "Transit Gateway Route Table ID"
  value       = aws_ec2_transit_gateway_route_table.tgw_route_table.id
}

output "route_table_arn" {
  description = "Transit Gateway Route Table ARN"
  value       = aws_ec2_transit_gateway_route_table.tgw_route_table.arn
}
