variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones to place subnets in"
  type        = list(string)
}

variable "project_name" {
  description = "Project name used for tagging"
  type        = string
}
