# @williamr
data "google_compute_subnetwork" "subnet" {
  name    = var.db_subnet_name[terraform.workspace]
  region  = var.db_subnet_region[terraform.workspace]
  project = var.db_subnet_project_id[terraform.workspace]
}

module "sql_instance_creation" {
  count                            = var.db_enabled[terraform.workspace] ? 1 : 0  
  source          = "git::https://github.com/Keoworld/tf_modules/google/db/sql_instance"
  name_engine_id                   = var.engine_prefix["postgresql"]
  name_project_id                  = local.business_app
  name_service_id                  = "operation"
  name_env_id                      = var.env_id[terraform.workspace]     
  db_version                       = var.db_system_version[terraform.workspace]
  db_region                        = var.google_region_map["primary"]     
  db_user_names                    = var.db_user_names_map[terraform.workspace]
  db_databases_names               = var.db_databases_names_map[terraform.workspace]
  db_instance_tier                 = var.db_instance_tier_map[terraform.workspace]
  app_db_disk_autoresize           = var.db_disk_autoresize_map[terraform.workspace]
  app_db_disk_size                 = var.db_disk_size_map[terraform.workspace]
  app_db_disk_autoresize_limite    = var.db_disk_autoresize_limite_map[terraform.workspace]
  db_multi_az                      = var.db_multi_az_map[terraform.workspace]
  db_private_network               = "projects/${var.db_subnet_project_id[terraform.workspace]}/global/networks/${var.db_network_name[terraform.workspace]}"
  db_subnetwork                    = data.google_compute_subnetwork.subnet.self_link
  depends_on = [
    google_project_service.enable-services
  ]
}