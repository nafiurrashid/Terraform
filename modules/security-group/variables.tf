variable "vpc_id" {
  description = "VPC ID where the security groups are created"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment (e.g., dev, staging, prod)"
  type        = string
}

variable "app_port" {
  description = "Port for the Laravel application"
  type        = number
  default     = 8000
}

variable "db_port" {
  description = "Port for the database (MySQL default is 3306)"
  type        = number
  default     = 3306
}
