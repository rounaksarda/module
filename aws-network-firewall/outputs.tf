output "firewall_id" {
  value = aws_networkfirewall_firewall.firewall.id
}

output "firewall_arn" {
  value = aws_networkfirewall_firewall.firewall.arn
}

output "firewall_status" {
  value = aws_networkfirewall_firewall.firewall.firewall_status
}
