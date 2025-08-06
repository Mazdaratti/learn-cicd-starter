variable "region" {
  type        = string
  description = "AWS region to deploy resources in"
}

variable "project_name" {
  type        = string
  description = "Name prefix for all resources"
  default = "Notely"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zones" {
  description = "Availability zones for subnet placement"
  type        = list(string)
  default     = ["eu-central-1a", "eu-central-1b"]
}
