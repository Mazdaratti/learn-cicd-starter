output "cluster_id" {
  value       = aws_ecs_cluster.this.id
  description = "ECS Cluster ID"
}

output "task_definition_arn" {
  value       = aws_ecs_task_definition.app.arn
  description = "ECS Task Definition ARN"
}

output "ecs_service_name" {
  value       = aws_ecs_service.app.name
  description = "ECS Service name"
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.this.name
  description = "ECS Cluster name"
}