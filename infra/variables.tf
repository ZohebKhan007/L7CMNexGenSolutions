variable "project" { type = string  default = "nexgen" }
variable "env"     { type = string  }
variable "location"{ type = string  default = "australiaeast" }

variable "sql_admin_user" { type = string }
variable "sql_admin_pass" { type = string  sensitive = true }
variable "django_secret"  { type = string  sensitive = true }
