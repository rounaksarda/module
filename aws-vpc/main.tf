resource "aws_vpc" "vpc" {

  cidr_block = var.cidr_block

  instance_tenancy = var.instance_tenancy

  # IPv4 IPAM
  ipv4_ipam_pool_id   = var.ipv4_ipam_pool_id
  ipv4_netmask_length = var.ipv4_netmask_length

  # IPv6 configuration
  assign_generated_ipv6_cidr_block = var.assign_generated_ipv6_cidr_block

  ipv6_cidr_block                    = var.ipv6_cidr_block
  ipv6_ipam_pool_id                  = var.ipv6_ipam_pool_id
  ipv6_netmask_length                = var.ipv6_netmask_length
  ipv6_cidr_block_network_border_group = var.ipv6_cidr_block_network_border_group

  enable_dns_support                     = var.enable_dns_support
  enable_dns_hostnames                   = var.enable_dns_hostnames
  enable_network_address_usage_metrics   = var.enable_network_address_usage_metrics

  tags = var.tags 
  #lookup(var.tags , var.tags, var.default.tags)
}
