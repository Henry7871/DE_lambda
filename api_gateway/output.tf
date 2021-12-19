output "base_url" {
  value = module.myApp.base_url
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.backend-bucket-DE-grp5.arn
  description = "The ARN of the S3 bucket"
}
output "dynamodb_table_name" {
  value       = aws_dynamodb_table.dynamodb-terraform-state-lock.name
  description = "The name of the DynamoDB table"
}