variable "cluster_name" {
  type        = string
  description = "ECS Cluster name"
}

variable "task_family" {
  type        = string
  description = "Task Definition family name"
}

variable "cpu" {
  type        = string
  description = "Task CPU units"
  default     = "256"
}

variable "memory" {
  type        = string
  description = "Task memory (MiB)"
  default     = "512"
}

variable "execution_role_arn" {
  type        = string
  description = "IAM role ARN for ECS task execution"
}

variable "task_role_arn" {
  type        = string
  description = "IAM role ARN for ECS task"
}

variable "container_name" {
  type        = string
  description = "Name of the container"
}

variable "container_image" {
  type        = string
  description = "Container image URI"
}

variable "container_cpu" {
  type        = number
  description = "CPU units reserved for container"
  default     = 256
}

variable "container_memory" {
  type        = number
  description = "Memory (MiB) reserved for container"
  default     = 512
}

variable "container_port" {
  type        = number
  description = "Port the container listens on"
  default     = 80
}

variable "environment_variables" {
  type        = list(object({
    name  = string
    value = string
  }))
  description = "Environment variables for the container"
  default     = []
}

variable "log_stream_prefix" {
  type        = string
  description = "CloudWatch Logs stream prefix"
}

variable "region" {
  type        = string
  description = "AWS Region"
}

variable "service_name" {
  type        = string
  description = "ECS Service name"
}

variable "desired_count" {
  type        = number
  description = "Desired number of ECS service tasks"
  default     = 1
}

variable "subnets" {
  type        = list(string)
  description = "List of subnet IDs for ECS tasks"
}

variable "security_groups" {
  type        = list(string)
  description = "List of security group IDs"
}

variable "assign_public_ip" {
  type        = bool
  description = "Assign public IP to ECS tasks"
  default     = false
}

variable "deployment_minimum_healthy_percent" {
  type        = number
  description = "Minimum healthy percent during deployment"
  default     = 100
}

variable "deployment_maximum_percent" {
  type        = number
  description = "Maximum percent of running tasks during deployment"
  default     = 200
}

variable "target_group_arn" {
  description = "ARN of the target group for the ECS service"
  type        = string
}

variable "project_name" {
  description = "Project name to prefix resources"
  type        = string
}


}