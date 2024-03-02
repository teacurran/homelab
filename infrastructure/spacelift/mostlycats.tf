resource "spacelift_space" "mostly_cats" {
  name = "Mostly Cats"
  parent_space_id = spacelift_space.base.id
  inherit_entities = true
}
