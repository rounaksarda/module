resource "aws_nat_gateway" "nat" {
  allocation_id = var.availability_mode == "zonal" ? var.allocation_id : null
  subnet_id     = var.availability_mode == "zonal" ? var.subnet_id : null
  private_ip    = var.private_ip

  connectivity_type = var.connectivity_type
  availability_mode = var.availability_mode
  vpc_id             = var.availability_mode == "regional" ? var.vpc_id : null

  secondary_allocation_ids             = var.secondary_allocation_ids
  secondary_private_ip_address_count   = var.secondary_private_ip_address_count
  secondary_private_ip_addresses       = var.secondary_private_ip_addresses

  dynamic "availability_zone_address" {
    for_each = var.availability_mode == "regional" ? var.availability_zone_address : []
    content {
      allocation_ids      = availability_zone_address.value.allocation_ids
      availability_zone   = lookup(availability_zone_address.value, "availability_zone", null)
      availability_zone_id = lookup(availability_zone_address.value, "availability_zone_id", null)
    }
  }

  tags = var.tags
}
