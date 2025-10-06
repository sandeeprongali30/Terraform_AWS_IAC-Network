# Terraform AWS Infrastructure Repository

This repository contains Terraform configurations for deploying and managing a complete AWS networking infrastructure, including VPC, subnets, NAT gateways, Internet Gateway, Flow Logs, and Peering connections.  
It follows a modular design for reusability and clean organization.

---

## Modules Overview

Each module contains Terraform resources specific to a single AWS infrastructure component:

| Module Name  | Purpose                                                |
| ------------ | ------------------------------------------------------ |
| **vpc**      | Creates a VPC with CIDR configuration                  |
| **subnets**  | Creates public and private subnets in specific AZs     |
| **igw**      | Creates an Internet Gateway and attaches it to the VPC |
| **nat**      | Creates NAT Gateway and routes for private subnets     |
| **flowlogs** | Configures VPC Flow Logs and CloudWatch Log Groups     |
| **peering**  | Establishes VPC Peering connections                    |

---

## Terraform Version Requirements

- **Terraform:** `>= 1.13`
- **AWS Provider:** `6.x`

Check Terraform version:

```bash
terraform -v


```
