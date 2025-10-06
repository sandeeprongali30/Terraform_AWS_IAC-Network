variable "public_subnets_cidr" {
  description = "List of CIDR blocks for public subnets."
  type        = list(string)
}
variable "env" {
  description = "Deployment environment (e.g., dev, staging, prod)."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}
variable "public_subnet_id" {
  description = "The ID of the public subnet where resources like NAT gateways will be created."
  type        = string
}
