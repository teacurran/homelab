resource "spacelift_space" "calendar" {
  name = "Calendar"
  parent_space_id = spacelift_space.mostly_Cats.id
  inherit_entities = true
}
