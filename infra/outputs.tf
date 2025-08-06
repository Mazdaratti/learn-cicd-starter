output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = module.alb.alb_dns_name
}

output "ecr_repository_url" {
  description = "URL of the ECR repository"
  value       = module.ecr.repository_url
}

output "ecs_cluster_id" {
  description = "ID of the ECS Cluster"
  value       = module.ecs.cluster_id
}

output "ecs_service_name" {
  value       = module.ecs.ecs_service_name
  description = "ECS Service name"
}

output "ecs_cluster_name" {
  value = module.ecs.ecs_cluster_name
  description = "ECS Cluster name"
}