output "load_balancer_sg_id" {
  description = "ID of the Load Balancer Security Group"
  value       = aws_security_group.lb_sg.id
}

output "application_sg_id" {
  description = "ID of the Application Security Group"
  value       = aws_security_group.app_sg.id
}

output "database_sg_id" {
  description = "ID of the Database Security Group"
  value       = aws_security_group.db_sg.id
}
