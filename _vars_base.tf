# All projects name have the following structure:
#   $cloud-$company-$country-$project-$environment
# Sample:
#   gc-k-usa-workeo-pro
# Variables: cloud_id, company_id, country_id, env_id are used to build the project name dinamically
variable "cloud_id" {
  description = "repreesents the cloud provider"
  type        = map(string)
  default = {
    google = "gc"
    azure  = "az"
    amazon = "am"
  }
}
variable "company_id" {
  description = "repreesents the company name, k for keoworld"
  type        = map(string)
  default = {
    keoworld = "k"
  }
}
variable "country_id" {
  description = "represents the three letters country's iso code to which the project belongs to ( gbl for a global project)"
  type        = map(string)
  default = {
    global   = "gbl"
    colombia = "col"
    mexico   = "mex"
    usa      = "usa"
    canada   = "can"
  }
}
variable "env_id" {
  description = "project environment"
  type        = map(string)
  # Keys are required in capital letters for manipulation in Github secrets.
  default = {
    default = "dev"
    DEV     = "dev"
    QA      = "qa"
    STG     = "stg"
    PRO     = "pro"
  }
}

variable "org_name" {
  description = "Name of the organization. Used for tagging and/or name prefixes"
  type        = string
  default     = "keoworld-com"
}
variable "org_id" {
  description = "ID of the organization. Get with CLI: gcloud organizations list"
  type        = string
  default     = "795761523920"
}
# Gcp folder where a mew project will be located
variable "folders_map" {
  description = "Used to get the folder id for each environment"
  type        = map(any)
  default = {
    DEV = "425099448188"
    STG = "298593106434"
    QA  = "138277203652"
    PRO = "462153497735"
  }
}
variable "gcp_billing_account_map" {
  description = "GCP billing account to use per environment"
  type        = map(any)
  default = {
    default = "01C4BB-1F633B-BC96A7"
    DEV     = "01C4BB-1F633B-BC96A7"
    STG     = "01C4BB-1F633B-BC96A7"
    QA      = "01C4BB-1F633B-BC96A7"
    PRO     = "01C4BB-1F633B-BC96A7"
  }
}
variable "google_region_map" {
  description = "GCP used regions"
  type        = map(any)
  default = {
    default   = "us-central1"
    primary   = "us-central1"
    secondary = "us-east4"
  }
}
variable "google_zone_map" {
  description = "GCP used zones"
  type        = map(any)
  default = {
    default   = "us-central1-a"
    primary   = "us-central1-a"
    secondary = "us-east4-a"
  }
}

variable "app_engine_enabled" {
  type        = map(any)
  description = "App engine is enabled"
  default = {
    DEV = true
    QA  = true
    STG = true
    PRO = true
  }
}

# Apis to be enabled in the project by environment
variable "google_services_map" {
  description = "Google service APIs to activate per environment"
  type        = map(any)
  default = {
    default = []
    DEV = ["apigateway.googleapis.com",
      "appengine.googleapis.com",
      "bigquery.googleapis.com",
      "bigqueryconnection.googleapis.com",
      "bigquerymigration.googleapis.com",
      "bigquerystorage.googleapis.com",
      "cloudapis.googleapis.com",
      "cloudbuild.googleapis.com",
      "clouddebugger.googleapis.com",
      "cloudfunctions.googleapis.com",
      "cloudresourcemanager.googleapis.com",
      "cloudscheduler.googleapis.com",
      "cloudtrace.googleapis.com",
      "compute.googleapis.com",
      "containerregistry.googleapis.com",
      "datastore.googleapis.com",
      "deploymentmanager.googleapis.com",
      "fcm.googleapis.com",
      "fcmregistrations.googleapis.com",
      "firebase.googleapis.com",
      "firebaseappcheck.googleapis.com",
      "firebaseappdistribution.googleapis.com",
      "firebasedatabase.googleapis.com",
      "firebasedynamiclinks.googleapis.com",
      "firebaseextensions.googleapis.com",
      "firebasehosting.googleapis.com",
      "firebaseinstallations.googleapis.com",
      "firebaseremoteconfig.googleapis.com",
      "firebaserules.googleapis.com",
      "firebasestorage.googleapis.com",
      "firestore.googleapis.com",
      "googlecloudmessaging.googleapis.com",
      "identitytoolkit.googleapis.com",
      "logging.googleapis.com",
      "mobilecrashreporting.googleapis.com",
      "monitoring.googleapis.com",
      "oslogin.googleapis.com",
      "pubsub.googleapis.com",
      "run.googleapis.com",
      "runtimeconfig.googleapis.com",
      "secretmanager.googleapis.com",
      "securetoken.googleapis.com",
      "servicecontrol.googleapis.com",
      "servicemanagement.googleapis.com",
      "servicenetworking.googleapis.com",
      "serviceusage.googleapis.com",
      "sql-component.googleapis.com",
      "sqladmin.googleapis.com",
      "storage-api.googleapis.com",
      "storage-component.googleapis.com",
      "storage.googleapis.com",
    "testing.googleapis.com"]
    QA = ["apigateway.googleapis.com",
      "appengine.googleapis.com",
      "bigquery.googleapis.com",
      "bigqueryconnection.googleapis.com",
      "bigquerymigration.googleapis.com",
      "bigquerystorage.googleapis.com",
      "cloudapis.googleapis.com",
      "cloudbuild.googleapis.com",
      "clouddebugger.googleapis.com",
      "cloudfunctions.googleapis.com",
      "cloudresourcemanager.googleapis.com",
      "cloudscheduler.googleapis.com",
      "cloudtrace.googleapis.com",
      "compute.googleapis.com",
      "containerregistry.googleapis.com",
      "datastore.googleapis.com",
      "deploymentmanager.googleapis.com",
      "fcm.googleapis.com",
      "fcmregistrations.googleapis.com",
      "firebase.googleapis.com",
      "firebaseappcheck.googleapis.com",
      "firebaseappdistribution.googleapis.com",
      "firebasedatabase.googleapis.com",
      "firebasedynamiclinks.googleapis.com",
      "firebaseextensions.googleapis.com",
      "firebasehosting.googleapis.com",
      "firebaseinstallations.googleapis.com",
      "firebaseremoteconfig.googleapis.com",
      "firebaserules.googleapis.com",
      "firebasestorage.googleapis.com",
      "firestore.googleapis.com",
      "googlecloudmessaging.googleapis.com",
      "identitytoolkit.googleapis.com",
      "logging.googleapis.com",
      "mobilecrashreporting.googleapis.com",
      "monitoring.googleapis.com",
      "oslogin.googleapis.com",
      "pubsub.googleapis.com",
      "run.googleapis.com",
      "runtimeconfig.googleapis.com",
      "secretmanager.googleapis.com",
      "securetoken.googleapis.com",
      "servicecontrol.googleapis.com",
      "servicemanagement.googleapis.com",
      "servicenetworking.googleapis.com",
      "serviceusage.googleapis.com",
      "sql-component.googleapis.com",
      "sqladmin.googleapis.com",
      "storage-api.googleapis.com",
      "storage-component.googleapis.com",
      "storage.googleapis.com",
    "testing.googleapis.com"]
    STG = ["apigateway.googleapis.com",
      "appengine.googleapis.com",
      "bigquery.googleapis.com",
      "bigqueryconnection.googleapis.com",
      "bigquerymigration.googleapis.com",
      "bigquerystorage.googleapis.com",
      "cloudapis.googleapis.com",
      "cloudbuild.googleapis.com",
      "clouddebugger.googleapis.com",
      "cloudfunctions.googleapis.com",
      "cloudresourcemanager.googleapis.com",
      "cloudscheduler.googleapis.com",
      "cloudtrace.googleapis.com",
      "compute.googleapis.com",
      "containerregistry.googleapis.com",
      "datastore.googleapis.com",
      "deploymentmanager.googleapis.com",
      "fcm.googleapis.com",
      "fcmregistrations.googleapis.com",
      "firebase.googleapis.com",
      "firebaseappcheck.googleapis.com",
      "firebaseappdistribution.googleapis.com",
      "firebasedatabase.googleapis.com",
      "firebasedynamiclinks.googleapis.com",
      "firebaseextensions.googleapis.com",
      "firebasehosting.googleapis.com",
      "firebaseinstallations.googleapis.com",
      "firebaseremoteconfig.googleapis.com",
      "firebaserules.googleapis.com",
      "firebasestorage.googleapis.com",
      "firestore.googleapis.com",
      "googlecloudmessaging.googleapis.com",
      "identitytoolkit.googleapis.com",
      "logging.googleapis.com",
      "mobilecrashreporting.googleapis.com",
      "monitoring.googleapis.com",
      "oslogin.googleapis.com",
      "pubsub.googleapis.com",
      "run.googleapis.com",
      "runtimeconfig.googleapis.com",
      "secretmanager.googleapis.com",
      "securetoken.googleapis.com",
      "servicecontrol.googleapis.com",
      "servicemanagement.googleapis.com",
      "servicenetworking.googleapis.com",
      "serviceusage.googleapis.com",
      "sql-component.googleapis.com",
      "sqladmin.googleapis.com",
      "storage-api.googleapis.com",
      "storage-component.googleapis.com",
      "storage.googleapis.com",
    "testing.googleapis.com"]
    PRO = ["apigateway.googleapis.com",
      "appengine.googleapis.com",
      "bigquery.googleapis.com",
      "bigqueryconnection.googleapis.com",
      "bigquerymigration.googleapis.com",
      "bigquerystorage.googleapis.com",
      "cloudapis.googleapis.com",
      "cloudbuild.googleapis.com",
      "clouddebugger.googleapis.com",
      "cloudfunctions.googleapis.com",
      "cloudresourcemanager.googleapis.com",
      "cloudscheduler.googleapis.com",
      "cloudtrace.googleapis.com",
      "compute.googleapis.com",
      "containerregistry.googleapis.com",
      "datastore.googleapis.com",
      "deploymentmanager.googleapis.com",
      "fcm.googleapis.com",
      "fcmregistrations.googleapis.com",
      "firebase.googleapis.com",
      "firebaseappcheck.googleapis.com",
      "firebaseappdistribution.googleapis.com",
      "firebasedatabase.googleapis.com",
      "firebasedynamiclinks.googleapis.com",
      "firebaseextensions.googleapis.com",
      "firebasehosting.googleapis.com",
      "firebaseinstallations.googleapis.com",
      "firebaseremoteconfig.googleapis.com",
      "firebaserules.googleapis.com",
      "firebasestorage.googleapis.com",
      "firestore.googleapis.com",
      "googlecloudmessaging.googleapis.com",
      "identitytoolkit.googleapis.com",
      "logging.googleapis.com",
      "mobilecrashreporting.googleapis.com",
      "monitoring.googleapis.com",
      "oslogin.googleapis.com",
      "pubsub.googleapis.com",
      "run.googleapis.com",
      "runtimeconfig.googleapis.com",
      "secretmanager.googleapis.com",
      "securetoken.googleapis.com",
      "servicecontrol.googleapis.com",
      "servicemanagement.googleapis.com",
      "servicenetworking.googleapis.com",
      "serviceusage.googleapis.com",
      "sql-component.googleapis.com",
      "sqladmin.googleapis.com",
      "storage-api.googleapis.com",
      "storage-component.googleapis.com",
      "storage.googleapis.com",
    "testing.googleapis.com"]
  }
}