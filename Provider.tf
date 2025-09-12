provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile # Optional: remove if using default credentials
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.5.0"
}
