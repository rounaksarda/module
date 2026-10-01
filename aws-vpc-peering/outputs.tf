output "vpc_peering_connection_id" {
  description = "VPC Peering Connection ID"
  value       = aws_vpc_peering_connection.peering.id
}

output "vpc_peering_connection_status" {
  description = "Status of the VPC Peering Connection"
  value       = aws_vpc_peering_connection.peering.accept_status
}

output "requester_vpc_id" {
  description = "Requester VPC ID"
  value       = aws_vpc_peering_connection.peering.vpc_id
}

output "accepter_vpc_id" {
  description = "Accepter VPC ID"
  value       = aws_vpc_peering_connection.peering.peer_vpc_id
}
