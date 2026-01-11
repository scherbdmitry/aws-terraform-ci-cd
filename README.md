# AWS Terraform CI/CD Demo

This repository demonstrates a **production-style Terraform project** with
**GitHub Actions CI** and **manual infrastructure apply**, designed as a
portfolio example for DevOps / Cloud roles.

The project focuses on:
- clean Terraform structure
- free-tier safe AWS infrastructure
- CI checks on every change (fmt / validate / plan)
- best practices for security and access management

---

## 🏗 Architecture Overview

The infrastructure provisions the following AWS resources:

- **VPC** with DNS enabled
- **2 public subnets** (multi-AZ)
- **Internet Gateway + public routing**
- **Security Group** (HTTP only, no SSH)
- **IAM Role + Instance Profile**
  - EC2 access via **AWS Systems Manager (SSM)** — no SSH keys
- **EC2 instance (Amazon Linux 2)**
  - Apache installed via `user_data`
  - Demo web page exposed on port 80

All resources are tagged and created using Terraform.

---

<h2>⚙️ Terraform Structure</h2>
<pre>
terraform/
├── main.tf          # Core infrastructure
├── variables.tf     # Input variables
├── providers.tf     # Provider configuration
├── versions.tf      # Terraform & provider versions
├── outputs.tf       # Useful outputs
└── .terraform.lock.hcl
</pre>
---

## 🔄 CI/CD Pipeline (GitHub Actions)

The project uses **GitHub Actions** for Continuous Integration.

### Trigger
- On **push** to `main`
- On **pull request** to `main`

### Pipeline steps
- `terraform fmt -check`
- `terraform init`
- `terraform validate`
- `terraform plan`

⚠️ **Terraform apply is intentionally NOT automated**  
to follow best practices and avoid unintended infrastructure changes.

Workflow file: .github/workflows/terraform-plan.yml

---

## 🚀 How to Run Locally

### Prerequisites
- Terraform >= 1.5
- AWS CLI configured
- IAM user with required permissions

### Commands
```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply

After apply, Terraform outputs a public URL for the demo page.

🔐 Security Notes
	•	No SSH access — EC2 managed via SSM
	•	No credentials committed to the repository
	•	State stored locally (remote backend intentionally omitted for demo simplicity)

  📌 Purpose of This Project

This repository is not a tutorial and not a production environment.

It is designed to:
	•	showcase Terraform and AWS fundamentals
	•	demonstrate CI/CD workflows for infrastructure
	•	serve as a portfolio project for DevOps / Cloud engineering roles