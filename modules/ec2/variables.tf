variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "subnet_id" {
  description = "Specific subnet ID (optional); overrides default private subnet"
  type        = string
  default     = ""
}

variable "associate_public_ip" {
  description = "Whether to associate a public IP (for public subnet)"
  type        = bool
  default     = false
}

variable "security_group_id" {
  description = "Security group ID to attach to the instance"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access (optional)"
  type        = string
  default     = "key"
}

variable "user_data" {
  description = "User data script to run on instance launch"
  type        = string
    default     = <<-EOF
    #!/bin/bash
    yum update -y
    amazon-linux-extras install -y nginx1
    systemctl start nginx
    systemctl enable nginx
  EOF
}

variable "root_volume_size" {
  description = "Size of the root EBS volume in GB"
  type        = number
  default     = 8
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
}

variable "environment" {
  description = "Environment name (dev/staging/prod)"
  type        = string
}
