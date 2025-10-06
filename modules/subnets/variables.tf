variable "env" {
  description = "Environment name (e.g., dev, qa, prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to associate subnets with"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "public_subnets_cidr" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}
variable "private_subnets_cidr" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}


variable "public_subnets_name" {
  description = "List of names for public subnets"
  type        = list(string)
}

variable "private_subnets_name" {
  description = "List of names for private subnets"
  type        = list(string)
}


variable "azs" {
  description = "List of availability zones for subnets"
  type        = list(string)
}

variable "private_rt_id" {
  description = "ID of the private route table"
  type        = string
}

variable "public_rt_id" {
  description = "ID of the public route table"
  type        = string
}
