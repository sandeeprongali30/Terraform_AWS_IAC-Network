variable "vpc_id" {
  description = "The ID of the VPC where flow logs will be enabled."
  type        = string
}

variable "log_group_name" {
  description = "Name of the CloudWatch Log Group for VPC Flow Logs."
  type        = string
}

variable "aws_iam_role_arn" {
  description = "IAM Role ARN for VPC Flow Logs."
  type        = string
}

variable "env" {
  description = "Deployment environment (e.g., dev, staging, prod)."
  type        = string
}
