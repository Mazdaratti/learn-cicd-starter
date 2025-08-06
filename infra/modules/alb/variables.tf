variable "project_name" {
  type        = string
  description = "Project name for resource naming"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where ALB will be deployed"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs for ALB"
}

variable "security_groups" {
  type        = list(string)
  description = "Security group IDs to attach to ALB"
  default     = []
}

variable "target_port" {
  type        = number
  description = "Port where the target group receives traffic"
  default     = 80
}

variable "listener_port" {
  type        = number
  description = "Port the ALB listens on"
  default     = 80
}

