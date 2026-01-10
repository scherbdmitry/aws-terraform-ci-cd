## Overview
This project demonstrates Infrastructure as Code (IaC) on AWS using Terraform, with a GitHub Actions CI/CD workflow that runs validation and planning on every change and applies updates via manual approval.

## Architecture
- Terraform provisions a small free-tier friendly AWS environment:
  - VPC + public subnets
  - Security Group
  - EC2 (t3.micro)
  - S3 + DynamoDB for remote state and state locking

## CI/CD Workflow
- `terraform-plan` runs on every pull request:
  - fmt / validate
  - init + plan
  - uploads the plan output as an artifact
- `terraform-apply` runs only on manual trigger:
  - requires approval
  - applies the planned changes

## How to run locally
1. Configure AWS credentials
2. `cd terraform`
3. `terraform init`
4. `terraform plan`
5. `terraform apply`

## Security & cost notes
- Designed to be free-tier safe (no NAT Gateway, no EKS/RDS/ALB)
- Uses least-privilege IAM where possible
- Remote state is stored in S3 and locked via DynamoDB

## What this demonstrates
- Terraform modules and reusable configuration patterns
- Safe infrastructure changes (plan → approve → apply)
- Practical AWS networking and IAM basics
