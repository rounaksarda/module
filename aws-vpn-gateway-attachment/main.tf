resource "aws_vpn_gateway_attachment" "vpn_gateway_attachment" {

  vpc_id         = var.vpc_id
  vpn_gateway_id = var.vpn_gateway_id
}
