# 🚀 EC2 IAM Terraform Practice

This project demonstrates how to create multiple IAM users on AWS using Terraform. The users are dynamically created from a list of names defined in a variable.

```
git clone https://github.com/swayams21/myrepo.git
cd terraform-iam
```
---

## 📁 Project Structure

```
project/
└── main.tf
```

---

## 🛠️ Prerequisites

* AWS CLI configured with valid credentials (`aws configure`)
* Terraform installed (`>= v1.0`)
* An IAM user/role with permission to create IAM users

---

## 📦 main.tf – Terraform Configuration

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"  # Change this as per your requirement
}

variable "names" {
  default = ["hari", "om", "rohit"]
}

resource "aws_iam_user" "my_iam_users" {
  for_each = toset(var.names)
  name     = each.value
}
```

---

## 🧪 Steps to Run

```bash
# Step 1: Create the project directory
cd ~/Downloads
mkdir project
cd project

# Step 2: Create the Terraform configuration file
touch main.tf
nano main.tf  # Paste the configuration above
```

### 🌐 Initialize Terraform

```bash
terraform init
```

### 📋 Review the Plan

```bash
terraform plan
```

### 🚀 Apply the Configuration

```bash
terraform apply
```

### 🧹 Destroy Resources

```bash
terraform destroy
```

---

## 📌 Notes

* The `for_each` loop uses a set of user names to create IAM users dynamically.
* Make sure your AWS credentials and permissions allow IAM operations.
* Terraform state will be saved in `terraform.tfstate` locally.

---

## 📚 Reference

* [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
* [IAM User Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user)

---
