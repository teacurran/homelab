terraform {
  required_version = "~> 1.5.7"

  required_providers {
    aws = {
      version = "~> 5.30.0"
      source  = "hashicorp/aws"
    }
    spacelift = {
      source = "spacelift-io/spacelift"
    }
  }

  backend "s3" {
    bucket = "appi-infrastructure-terraform-state"
    key    = "infrastructure-spacelift.tfstate"
    region = "us-east-1"
  }
}

variable "spacelift_key_id" {}
variable "spacelift_key_secret" {}

provider "spacelift" {
  api_key_endpoint = "https://teacurran.app.spacelift.io"
  api_key_id       = var.spacelift_key_id
  api_key_secret   = var.spacelift_key_secret
}

data "spacelift_space_by_path" "base" {
  space_path = "root/186282"
}

