provider "aws" {
  region = var.region
}

module "ecr" {
  source       = "./modules/ecr"
  project_name = var.project_name
}

module "network" {
  source             = "./modules/network"
  project_name       = var.project_name
  vpc_cidr           = var.vpc_cidr
  public_subnets_cidrs = var.public_subnets_cidrs
  availability_zones = var.availability_zones
}

module "iam" {
  source       = "./modules/iam"
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.network.vpc_id
  project_name = var.project_name
}

module "alb" {
  source = "./modules/alb"

  project_name      = var.project_name
  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
  security_groups = [module.security_groups.alb_sg_id]

  target_port   = 8080
  listener_port = 80
}


module "ecs" {
  source = "./modules/ecs"

  cluster_name       = "${var.project_name}-cluster"
  task_family        = "${var.project_name}-task"
  cpu                = "256"
  memory             = "512"
  container_name     = "notely"
  container_image    = "${module.ecr.repository_url}:latest"
  container_cpu      = 256
  container_memory   = 512
  container_port     = 8080
  environment_variables = [
    {
      name  = "PORT"
      value = "8080"
    }
  ]
  execution_role_arn = module.iam.ecs_task_execution_role_arn
  task_role_arn      = module.iam.ecs_task_role_arn
  service_name       = "${var.project_name}-service"
  desired_count      = 1
  subnets            = module.network.public_subnet_ids
  security_groups    = [module.security_groups.ecs_service_sg_id]
  assign_public_ip   = true
  log_stream_prefix  = "ecs"
  target_group_arn   = module.alb.target_group_arn
  region             = var.region

  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200
  project_name                       = var.project_name
}
