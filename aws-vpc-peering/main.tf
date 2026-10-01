resource "aws_vpc_peering_connection" "peering" {

  vpc_id      = var.vpc_id
  peer_vpc_id = var.peer_vpc_id

  peer_owner_id = var.peer_owner_id
  peer_region   = var.peer_region

  auto_accept = var.auto_accept

  dynamic "requester" {
    for_each = var.requester != null ? [var.requester] : []
    content {
      allow_remote_vpc_dns_resolution = lookup(requester.value, "allow_remote_vpc_dns_resolution", null)
    }
  }

  dynamic "accepter" {
    for_each = var.accepter != null ? [var.accepter] : []
    content {
      allow_remote_vpc_dns_resolution = lookup(accepter.value, "allow_remote_vpc_dns_resolution", null)
    }
  }

  tags = var.tags
}
