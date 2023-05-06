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
  project = join ("-", [local.project_base_name, var.env_id[terraform.workspace]])
  region  = var.google_region_map["primary"]
  zone    = var.google_zone_map["primary"]
}
/*
module "bucket-backend" {
  source          = "./modules/google/bucket/backend"
  count           = terraform.workspace == "default" ? 1 : 0
  bucket_name     = local.tfstate_name
  location        = var.google_region_map[terraform.workspace]
  additional_tags = local.default_tags
  project_id      = local.project_id[terraform.workspace]
} 
*/