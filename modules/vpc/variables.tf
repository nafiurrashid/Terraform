variable "aws_region" {
  description = "AWS region to deploy VPC"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "project_name" {
  default = "security-project-terraform"
  type    = string
}

variable "vpc_tags" {
  default = {
    Name = "security-project-terraform"
  }
}

# variable "subnet_count" {
#   default = 2

# }


variable "pub_ciders" {
  default = ["10.0.0.0/24", "10.0.1.0/24"]

}

variable "priv_ciders" {
  default = ["10.0.2.0/24", "10.0.3.0/24"]

}

variable "db_ciders" {
  default = ["10.0.4.0/24", "10.0.5.0/24"]

}



