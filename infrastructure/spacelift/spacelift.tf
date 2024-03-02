provider "spacelift" {}

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

