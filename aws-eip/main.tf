resource "aws_eip" "eip" {
  domain = var.domain

  address                 = var.address
  public_ipv4_pool         = var.public_ipv4_pool
  customer_owned_ipv4_pool = var.customer_owned_ipv4_pool
  ipam_pool_id             = var.ipam_pool_id
  network_border_group     = var.network_border_group

  instance                  = var.instance
  network_interface         = var.network_interface
  associate_with_private_ip = var.associate_with_private_ip

  tags = var.tags
}
