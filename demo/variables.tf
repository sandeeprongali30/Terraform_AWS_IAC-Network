variable "vault_role_id" {
  description = "Vault AppRole Role ID"
  type        = string
  default     = ""
}

variable "vault_secret_id" {
  description = "Vault AppRole Secret ID"
  type        = string
  default     = ""
}

variable "AccessKey" {
  default = ""
}

variable "SecretKey" {
  default = ""
}

variable "azs" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}

variable "aws_region" {
  default = "ap-south-1"
}


variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  default = "platform-Terraform"
}

variable "public_subnets_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets_cidr" {
  type    = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]

}

variable "env" {
  default = "demo"
}

variable "public_subnets_name" {
  type    = list(string)
  default = ["Platform-Public-Subnet1", "Platform-Public-Subnet2"]
}

variable "private_subnets_name" {
  type    = list(string)
  default = ["Project1-Private-Subnet", "Project2-Private-Subnet", "Project1-DB-Private-Subnet"]
}

variable "vault_token" {
  description = "Vault authentication token for Terraform Vault provider"
  type        = string
  default     = ""
}

variable "aws_iam_role_arn" {
  description = "IAM Role ARN for VPC Flow Logs"
  type        = string
  sensitive   = true
}

variable "log_group_name" {
  description = "CloudWatch Log Group name for VPC Flow Logs"
  type        = string
}
