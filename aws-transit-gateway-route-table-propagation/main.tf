resource "aws_ec2_transit_gateway_route_table_propagation" "tgw_rt_propagation" {
  transit_gateway_attachment_id  = try(var.transit_gateway_attachment_id, null)
  transit_gateway_route_table_id = try(var.transit_gateway_route_table_id, null)

  lifecycle {
    create_before_destroy = true
  }
}
