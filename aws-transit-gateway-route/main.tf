resource "aws_ec2_transit_gateway_route" "tgw_route" {

  region = var.region

  destination_cidr_block         = var.destination_cidr_block
  transit_gateway_route_table_id = var.transit_gateway_route_table_id

  transit_gateway_attachment_id = var.blackhole == false ? var.transit_gateway_attachment_id : null

  blackhole = var.blackhole
}
