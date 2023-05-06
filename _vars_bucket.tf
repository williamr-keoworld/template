/*-------------- Variables for bucket creation purposes --------------*/

  variable "force_destroy" {
    description = "Force the bucket deletion"
    type        = string
    default     = "false"
  }  
  variable storage_class {
    description = "Storage class depends on the bucket purpose ( Depends on the required access frequency)"
    type        = map(any)
    default     = {
      standard  = "STANDARD"    # None
      nearline  = "NEARLINE"    # 30 days
      coldline  = "COLDLINE"    # 90 days
      archive   = "ARCHIVE"     # 365 days
    }
  }  
  variable versioning {
    description = "Version for recovery purposes"
    type        = string
    default     = "true"
  } 

  variable bucket_names_map{
  type        = map(any)
  default     = {
    DEV     = ["files", "cuentas", "bancos"]
    QA      = ["files"]
    STG     = ["files"]
    PRO     = ["files"]
  }
}
