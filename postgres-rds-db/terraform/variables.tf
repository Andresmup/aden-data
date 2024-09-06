variable "app_name" {
  type        = string
  description = "Application Name"
  default     = "aden"
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

