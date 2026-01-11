variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name prefix for tagging and resource naming"
  type        = string
  default     = "aws-terraform-ci-cd"
}

variable "environment" {
  description = "Environment name (e.g., dev)"
  type        = string
  default     = "dev"
}

