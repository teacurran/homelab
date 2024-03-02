provider "spacelift" {}

terraform {
  required_providers {
    spacelift = {
      source = "spacelift-io/spacelift"
    }
  }
}

data "spacelift_space_by_path" "root" {
  space_path = "root"
}

resource "spacelift_space" "base" {
  name = "186282"
  parent_space_id = data.spacelift_space_by_path.root.id
}
