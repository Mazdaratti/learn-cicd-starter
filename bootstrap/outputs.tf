output "backend_bucket_name" {
  description = "The name of the S3 bucket for Terraform state"
  value       = aws_s3_bucket.terraform_state.id
}

output "dynamodb_table_name" {
  description = "The name of the DynamoDB table for Terraform state locking"
  value       = aws_dynamodb_table.terraform_locks.name
}

output "github_role_arn" {
  description = "The ARN of the IAM Role that GitHub Actions can assume via OIDC"
  value       = aws_iam_role.github_actions_role.arn
}

