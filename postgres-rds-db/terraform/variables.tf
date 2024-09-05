variable "app_name" {
  type        = string
  description = "Application Name"
  default     = "adea"
}

variable "app_environment" {
  type        = string
  description = "Application Environment"
  default     = "dev"
}

variable "db_password" {
  type        = string
  description = "Database master password"
  sensitive   = true
}

