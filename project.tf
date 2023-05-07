locals {
  this_project_labels = merge(local.general_default_labels, {
  })
  this_project_services = concat(var.google_services_map[terraform.workspace],
    []
  )
}

resource "google_project" "keo-project" {
  name            = join("-", [local.project_base_name, var.env_id[terraform.workspace]])
  project_id      = local.project_id
  folder_id       = local.folder_id
  billing_account = local.billing_account
}

resource "google_project_service" "enable-services" {
  project  = google_project.keo-project.id
  for_each = toset(local.this_project_services)
  service  = each.key
  timeouts {
    create = "30m"
    update = "40m"
  }
  disable_dependent_services = true
}