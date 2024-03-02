variable "spacelift_key_id" {}
variable "spacelift_key_secret" {}

provider "spacelift" {
  api_key_endpoint = "https://teacurran.app.spacelift.io"
  api_key_id       = var.spacelift_key_id
  api_key_secret   = var.spacelift_key_secret
}

terraform {
  required_providers {
    spacelift = {
      source = "spacelift-io/spacelift"
    }
  }
}

data "spacelift_space_by_path" "base" {
  space_path = "root/186282"
}

