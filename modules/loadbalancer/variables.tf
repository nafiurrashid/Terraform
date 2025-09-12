variable "project_name" {
  description = "Project name for tagging and naming"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g. dev, staging, prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the load balancer and target group"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs where the ALB will be placed"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security Group ID to associate with the ALB"
  type        = string
}

variable "instance_ids" {
  description = "List of EC2 instance IDs to attach to the target group"
  type        = list(string)
  default     = []
}

variable "target_port" {
  description = "Port on EC2 instances to forward traffic to"
  type        = number
  default     = 80
}

variable "health_check_path" {
  description = "Health check path for the target group"
  type        = string
  default     = "/"
}
