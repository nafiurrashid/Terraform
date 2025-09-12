output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}



output "application_sg_id" {
  description = "ID of the Application Security Group"
  value       = module.security_group.application_sg_id
}

output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = module.ec2_app.instance_id
}
# output "cloudtrail_bucket" {
#   description = "Name of the CloudTrail log bucket"
#   value       = module.cloudtrail.bucket_name
# }
output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = module.loadbalancer.alb_dns_name
}