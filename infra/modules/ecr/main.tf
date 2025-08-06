resource "aws_ecr_repository" "this" {
  name                 = "${var.project_name}-app"
  image_tag_mutability = "MUTABLE"

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = "${var.project_name}-ecr"
    Environment = "dev"
  }
}