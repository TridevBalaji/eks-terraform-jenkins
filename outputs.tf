output "cluster_name" {
  description = "EKS Cluster Name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "EKS Cluster API Server Endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_version" {
  description = "EKS Kubernetes Version"
  value       = module.eks.cluster_version
}

output "cluster_security_group_id" {
  description = "EKS Cluster Security Group ID"
  value       = module.eks.cluster_security_group_id
}

output "node_group_role_arn" {
  description = "IAM Role ARN of the EKS node group"
  value       = module.eks.eks_managed_node_groups["nodes"].iam_role_arn
}
