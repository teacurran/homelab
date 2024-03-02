resource "spacelift_space" "mostly_cats" {
  name = "Mostly Cats"
  parent_space_id = data.spacelift_space_by_path.base.id
  inherit_entities = true
}
