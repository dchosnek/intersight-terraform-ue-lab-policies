variable "org_moid" {
  description = "Organization MOID where the domain policies will be created."
  type        = string
}

variable "tags" {
  description = "Tags applied to domain policies."
  type        = map(string)
  default     = {}
}

variable "ntp_policy_moid" {
  description = "MOID of the NTP policy to attach to the Unified Edge switch profile template."
  type        = string
}

variable "local_user_password" {
  description = "Password for the local endpoint admin user."
  type        = string
  sensitive   = true
}
