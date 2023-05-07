resource "google_app_engine_application" "app" {
  project     = google_project.keo-project.id
  location_id = var.google_region_map["primary"]
}