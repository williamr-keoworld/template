locals {
  general_default_labels = {
    managed_by = "terraform"
    org_name   = var.org_name
    org_id     = var.org_id
    env        = terraform.workspace
    env_id     = var.env_id[terraform.workspace]
  }
  billing_account = var.gcp_billing_account_map[terraform.workspace]
  cloud_id        = var.cloud_id["google"]
  company_id      = var.company_id["keoworld"]
  country_id      = var.country_id["mexico"]
  business_app    = "workeotodelete6"
  project_base_name = join("-", [
    local.cloud_id,
    local.company_id,
    local.country_id,
    local.business_app
  ])
  project_name = join("-", [local.project_base_name, var.env_id[terraform.workspace]])
  project_id   = local.project_name
  folder_id    = var.folders_map[terraform.workspace]
}
