variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}

variable "env" {
  description = "Deployment environment (e.g., dev, staging, prod)."
  type        = string
}
