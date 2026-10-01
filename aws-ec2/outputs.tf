output "instance_id" {
  value = aws_instance.ec2.id
}

output "instance_arn" {
  value = aws_instance.ec2.arn
}

output "private_ip" {
  value = aws_instance.ec2.private_ip
}

output "public_ip" {
  value = aws_instance.ec2.public_ip
}

output "availability_zone" {
  value = aws_instance.ec2.availability_zone
}
