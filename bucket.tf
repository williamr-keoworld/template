
module "bucket_creation" {
  count = length(var.bucket_names_map[terraform.workspace])
  source = "github.com/Keoworld/tf_modules/tree/main/google/bucket"
  bucket_name = join("-", [join ("-", [local.project_base_name, var.env_id[terraform.workspace]]) ,var.bucket_names_map[terraform.workspace][count.index]])
  location = var.google_region_map["primary"]
  force_destroy = var.force_destroy
  storage_class = var.storage_class["standard"]
  project_id = local.project_id
  versioning = var.versioning
  bucket_labels = local.general_default_labels
}

