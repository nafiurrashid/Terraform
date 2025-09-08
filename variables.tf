variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-west-1"
}

variable "aws_profile" {
  description = "AWS CLI profile name"
  type        = string
  default     = "default"
}

variable "project_name" {
  description = "Name of the project for tagging"
  type        = string
  default     = "secure-cloud-infra"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}
