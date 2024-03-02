terraform {
  required_version = "~> 1.5.7"

  required_providers {
    aws = {
      version = "~> 5.30.0"
      source  = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "appi-infrastructure-terraform-state"
    key    = "aws_access.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_role" "spacelift" {
  name = "spacelift"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          AWS = "324880187172"
        },
        Condition = {
          StringLike = {
            "sts:ExternalId" = "teacurran@*"
          }
        }
      }
    ]
  })
}