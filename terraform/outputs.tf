output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = aws_subnet.public[*].id
}

output "private_subnets" {
  value = aws_subnet.private[*].id
}

output "frontend_instance_ip" {
  value = aws_instance.frontend.private_ip
}

output "backend_instance_ip" {
  value = aws_instance.backend.private_ip
}

output "db_instance_ip" {
  value = aws_instance.db.private_ip
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.app_alb.dns_name
}

output "bastion_public_ip" {
  description = "Public IP address of the bastion host"
  value       = aws_instance.bastion.public_ip
}
