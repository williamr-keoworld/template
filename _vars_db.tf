variable "db_enabled" {
  type        = map(any)
  description = "Application database is enabled"
  default = {
    DEV = true
    QA  = true
    STG = true
    PRO = true
  }
}
variable "engine_prefix" {
  description = "Prefix to be used in the instance name to identify the engine usded by the instance"
  type        = map(any)
  default = {
    postgresql = "pg"
    mysql      = "ms"
    sqlserver  = "ss"
  }
}

variable "db_system_version" {
  type = map(any)
  default = {
    DEV = "POSTGRES_14"
    QA  = "POSTGRES_14"
    STG = "POSTGRES_14"
    PRO = "POSTGRES_14"
  }
}
variable "db_instance_tier_map" {
  type = map(any)
  default = {
    DEV = "db-f1-micro"
    QA  = "db-f1-micro"
    STG = "db-f1-micro"
    PRO = "db-f1-micro"
  }
}
variable "db_disk_autoresize_map" {
  type = map(any)
  default = {
    DEV = true
    QA  = true
    STG = true
    PRO = true
  }
}
variable "db_disk_size_map" {
  type = map(any)
  default = {
    DEV = 10
    QA  = 10
    STG = 10
    PRO = 10
  }
}
variable "db_disk_autoresize_limite_map" {
  type = map(any)
  default = {
    DEV = 20
    QA  = 20
    STG = 20
    PRO = 20
  }
}
variable "db_user_names_map" {
  type = map(any)
  default = {
    DEV = ["postgres", "appconnect", "localuser"]
    QA  = ["postgres", "appconnect", "localuser"]
    STG = ["postgres", "appconnect", "localuser"]
    PRO = ["postgres", "appconnect", "localuser"]
  }
}
variable "db_databases_names_map" {
  type = map(any)
  default = {
    DEV = ["mxkeorailsdb"]
    QA  = ["mxkeorailsdb"]
    STG = ["mxkeorailsdb"]
    PRO = ["mxkeorailsdb"]
  }
}
variable "db_multi_az_map" {
  type = map(any)
  default = {
    DEV = false
    QA  = true
    STG = true
    PRO = true
  }
}
variable "db_network_name" {
  type = map(any)
  default = {
    DEV = "sql-db-vpc-standard-1"
    QA  = "sql-db-vpc-standard-1"
    STG = "sql-db-vpc-standard-1"
    PRO = "sql-db-vpc-standard-1"
  }
}
variable "db_subnet_name" {
  type = map(any)
  default = {
    DEV = "sql-db-vpc-standard-subnet"
    QA  = "sql-db-vpc-standard-subnet"
    STG = "sql-db-vpc-standard-subnet"
    PRO = "sql-db-vpc-standard-subnet"
  }
}
variable "db_subnet_region" {
  type = map(any)
  default = {
    DEV = "us-central1"
    QA  = "us-central1"
    STG = "us-central1"
    PRO = "us-central1"
  }
}
variable "db_subnet_project_id" {
  type = map(any)
  default = {
    DEV = "gc-k-gbl-nw-host-standard"
    QA  = "gc-k-gbl-nw-host-standard"
    STG = "gc-k-gbl-nw-host-standard"
    PRO = "gc-k-gbl-nw-host-standard"
  }
}