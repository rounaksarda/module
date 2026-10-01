output "id" {
  description = "ID of the Transit Gateway Route Table Propagation."
  value       = aws_ec2_transit_gateway_route_table_propagation.tgw_rt_propagation.id
}

output "transit_gateway_attachment_id" {
  description = "Transit Gateway Attachment ID used for propagation."
  value       = aws_ec2_transit_gateway_route_table_propagation.tgw_rt_propagation.transit_gateway_attachment_id
}

output "transit_gateway_route_table_id" {
  description = "Transit Gateway Route Table ID used for propagation."
  value       = aws_ec2_transit_gateway_route_table_propagation.tgw_rt_propagation.transit_gateway_route_table_id
}
