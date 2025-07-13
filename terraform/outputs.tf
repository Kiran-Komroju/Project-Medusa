output "ecr_url" { value = aws_ecr_repository.medusa.repository_url }
output "vpc_id" { value = aws_vpc.main.id }
output "public_subnet_ids" { value = aws_subnet.public[*].id }
output "security_group_id" { value = aws_security_group.sg.id }
output "ecs_cluster_name" { value = aws_ecs_cluster.medusa_cluster.name }
