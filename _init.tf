terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.56.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  backend "gcs" {
  }
}

provider "google" {
  project = join("-", [local.project_base_name, var.env_id[terraform.workspace]])
  region  = var.google_region_map["primary"]
  zone    = var.google_zone_map["primary"]
}