output "cluster_id" {
  value = aws_eks_cluster.aws_eks_cluster.id
}

output "cluster_name" {
  value = aws_eks_cluster.aws_eks_cluster.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.aws_eks_cluster.endpoint
}

output "cluster_arn" {
  value = aws_eks_cluster.aws_eks_cluster.arn
}

output "cluster_certificate_authority" {
  value = aws_eks_cluster.aws_eks_cluster.certificate_authority[0].data
}

output "cluster_security_group_id" {
  value = aws_eks_cluster.aws_eks_cluster.vpc_config[0].cluster_security_group_id
}