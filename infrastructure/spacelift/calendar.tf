resource "spacelift_space" "calendar" {
  name = "Calendar"
  parent_space_id = spacelift_space.mostly_Cats.id
  inherit_entities = true
}

resource "spacelift_stack" "calendar-production" {
  name                     = "Calendar - production"
  space_id                 = spacelift_space.calendar.id
  repository               = "design"
  branch                   = "main"
  project_root             = "calendar/infrastructure"
  manage_state             = false
  workspace               = "production"
  terraform_version        = "1.5.7 - 1.6.2"
}
