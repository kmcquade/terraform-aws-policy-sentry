variable "name" {
  description = "The name of the rendered policy file (no file extension)."
  type        = "string"
}

variable "create_policy" {
  description = "Set to true to create the actual IAM policies. Defaults to true."
  default     = true
  type        = bool
}

variable "read_access_level" {
  description = "Provide a list of Amazon Resource Names (ARNs) that your role needs READ access to."
  type        = "list"
  default     = [""]
}

variable "write_access_level" {
  description = "Provide a list of Amazon Resource Names (ARNs) that your role needs WRITE access to."
  type        = "list"
  default     = [""]
}

variable "list_access_level" {
  description = "Provide a list of Amazon Resource Names (ARNs) that your role needs LIST access to."
  type        = "list"
  default     = [""]
}

variable "tagging_access_level" {
  description = "Provide a list of Amazon Resource Names (ARNs) that your role needs TAGGING access to."
  type        = "list"
  default     = [""]
}

variable "permissions_management_access_level" {
  description = "Provide a list of Amazon Resource Names (ARNs) that your role needs PERMISSIONS MANAGEMENT access to."
  type        = "list"
  default     = [""]
}

variable "wildcard_only_actions" {
  description = "Only actions that do not support resource constraints"
  type        = "list"
  default     = [""]
}

variable "minimize" {
  description = "If set to true, it will minimize the size of the IAM Policy file. Defaults to false."
  default     = false
  type        = bool
}