# Infraestrutura Provisionada com Terraform

## Recursos Provisionados

- VPC e sub-redes
- Grupos de segurança
- Cluster ECS
- Serviço ECS para a aplicação web
- Tarefa ECS para a aplicação web
- Instância RDS
- Auto Scaling Group
- Application Load Balancer
- Buckets do S3
- Grupo de logs do CloudWatch
- AWS Certificate Manager (ACM)
- Repositório ECR
- Provedor de capacidade do ECS
- Roles e políticas do IAM para ECS
- Instâncias EC2
- Template de lançamento para EC2
- Configuração de DNS no Route 53
- Segredos no Secrets Manager para o banco de dados
- Segredos no Secrets Manager para a aplicação web

## Arquivos Terraform Utilizados

1. `locals.tf`: Define as variáveis locais necessárias para a configuração dos recursos.
2. `variables.tf`: Define as variáveis necessárias para a configuração dos recursos.
3. `outputs.tf`: Especifica os outputs que serão exibidos após a aplicação do Terraform.
4. `aws_acm.tf`: Configura o AWS Certificate Manager.
5. `aws_alb.tf`: Configura o Application Load Balancer.
6. `aws_asg_ecs_bia_web.tf`: Define o Auto Scaling Group.
7. `aws_buckets.tf`: Configura o bucket do S3 para armazenar o arquivo state do Terraform.
8. `aws_cloudwatch_log_group.tf`: Configura o grupo de logs do CloudWatch.
9. `aws_db_instance.tf`: Configura a instância do banco de dados RDS.
10. `aws_ecr.tf`: Cria o repositório ECR.
11. `aws_ecs_capacity_provider.tf`: Configura o provedor de capacidade do ECS.
12. `aws_ecs_cluster.tf`: Configura o cluster ECS.
13. `aws_ecs_service_bia_web.tf`: Configura o serviço ECS para a aplicação web.
14. `aws_ecs_task_definition_bia_web.tf`: Define a tarefa ECS para a aplicação web.
15. `aws_iam_ecs_role.tf`: Configura as roles do IAM para o ECS.
16. `aws_iam_ecs_task_role.tf`: Configura as roles do IAM para as tarefas do ECS.
17. `aws_iam.tf`: Configura outras roles e políticas do IAM.
18. `aws_instance.tf`: Configura as instâncias EC2.
19. `aws_launch_template.tf`: Define o template de lançamento para as instâncias EC2.
20. `aws_route_53.tf`: Configura o Route 53.
21. `aws_secrets_bia_db.tf`: Configura os segredos para o banco de dados no Secrets Manager.
23. `aws_security_groups.tf`: Define os grupos de segurança.
24. `state_config.tf`: Configura o estado do Terraform.

## Variáveis

As principais variáveis que podem ser configuradas estão em `variables.tf`. Ajuste-as conforme necessário para seu ambiente.

## Outputs

Após a aplicação bem-sucedida, o Terraform fornecerá outputs importantes, como URLs e endpoints, que podem ser encontrados em `outputs.tf`.