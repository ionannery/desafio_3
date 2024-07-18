output "instance_name" {
  description = "Nome da instancia"
  value       = var.instance_name
}

output "instance_id" {
  description = "ID da instancia"
  value       = aws_instance.bia-dev.id
}


output "instance_type" {
  description = "Tipo da instancia"
  value       = aws_instance.bia-dev.instance_type
}


output "instance_security_group" {
  description = "Grupo de seguranca da instancia"
  value       = aws_instance.bia-dev.security_groups
}


output "instance_public_ip" {
  description = "IP publico da instancia"
  value       = aws_instance.bia-dev.public_ip
}

output "rds_endpoint" {
  description = "Endpoint do RDS da bia"
  value       = aws_db_instance.bia-db.endpoint
}


output "bia_repository_url" {
  description = "URL do repositorio do ECR"
  value       = aws_ecr_repository.bia.repository_url
}


output "rds_secret_name" {
  description = "Nome do meu segredo"
  value       = data.aws_secretsmanager_secret.bia_db.name
}

output "alb_url" {
  value = aws_lb.bia.dns_name
}
