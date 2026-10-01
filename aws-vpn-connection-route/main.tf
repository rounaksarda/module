resource "aws_vpn_connection_route" "aws_vpn_connection_route" {

  vpn_connection_id      = var.vpn_connection_id
  destination_cidr_block = var.destination_cidr_block
}