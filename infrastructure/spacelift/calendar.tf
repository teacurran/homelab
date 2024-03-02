resource "spacelift_space" "calendar" {
  name = "Calendar"
  parent_space_id = spacelift_space.mostly_cats.id
  inherit_entities = true
}

resource "spacelift_stack" "calendar-production" {
  name                     = "Calendar - production"
  space_id                 = spacelift_space.mostly_cats.id
  repository               = "design"
  branch                   = "main"
  project_root             = "calendar/infrastructure"
  manage_state             = false
  terraform_workspace      = "production"
  terraform_version        = "1.5.7 - 1.6.2"
}

resource "spacelift_aws_integration_attachment" "calendar-production" {
  stack_id = spacelift_stack.calendar-production.id
  integration_id = data.spacelift_aws_integration.default.id
}
