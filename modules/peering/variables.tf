# VPC Peering - Input Variables (Production Ready)

variable "vpc_cidr" {
  description = "CIDR block of the VPC to peer with."
  type        = string
}

variable "infra_vpc_id" {
  description = "VPC ID of the infrastructure VPC."
  type        = string
}

variable "infra_route_table_ids" {
  description = "List of route table IDs associated with the infrastructure VPC."
  type        = list(string)
}

variable "infra_vpc_cidr" {
  description = "CIDR block of the infrastructure VPC."
  type        = string
  default     = "10.1.0.0/16"
}

variable "infra_security_group_id" {
  description = "Security group ID associated with the infrastructure VPC."
  type        = string
}

variable "internal_access_security_group_id" {
  description = "Security group ID for internal access between peered VPCs."
  type        = string
}
