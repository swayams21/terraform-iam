terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.4.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"  # or your preferred region
}


variable "names" {
  default = ["hari", "om", "rohit"]
}

resource "aws_iam_user" "my_iam_users" {
  for_each = toset(var.names)
  name     = each.value
}
