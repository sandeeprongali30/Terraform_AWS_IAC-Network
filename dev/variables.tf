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
  default = "10.31.0.0/16"
}
variable "vpc_name" {
  default = "Dev_PF_Mumbai"
}

variable "public_subnets_cidr" {
  type    = list(string)
  default = ["10.31.1.0/24", "10.31.2.0/24"]
}
variable "private_subnets_cidr" {
  type    = list(string)
  default = ["10.31.3.0/24", "10.31.4.0/24", "10.31.5.0/24"]

}
variable "env" {
  description = "Deployment environment (dev/staging/prod)"
  type        = string
}


variable "public_subnets_name" {
  type    = list(string)
  default = ["Dev_PF_PublicSubnet1", "Dev_PF_PublicSubnet2"]
}

variable "private_subnets_name" {
  type    = list(string)
  default = ["Dev_PF_Private_Subnet1", "Dev_PF_Private_Subnet2", "Dev_PF_Private_Subnet3"]
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
