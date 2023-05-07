resource "google_app_engine_application" "app" {
  count       = var.app_engine_enabled[terraform.workspace] ? 1 : 0
  project     = google_project.keo-project.id
  location_id = var.google_region_map["primary"]
}