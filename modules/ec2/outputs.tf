output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.this.id
}

output "private_ip" {
  description = "Private IP of the EC2 instance"
  value       = aws_instance.this.private_ip
}

output "public_ip" {
  description = "Public IP of the EC2 instance (if assigned)"
  value       = aws_instance.this.public_ip
}

output "instance_arn" {
  description = "ARN of the EC2 instance"
  value       = aws_instance.this.arn
}
