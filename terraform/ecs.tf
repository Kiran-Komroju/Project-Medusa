resource "aws_ecs_cluster" "medusa_cluster" {
  name = "medusa-cluster"
}

resource "aws_ecs_task_definition" "medusa_task" {
  family                   = "medusa-task"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_exe_role.arn

  container_definitions = jsonencode([{
    name      = "medusa"
    image     = "${aws_ecr_repository.medusa.repository_url}:latest"
    essential = true
    portMappings = [{
      containerPort = 9000
      hostPort      = 9000
    }]
  }])
}

resource "aws_ecs_service" "medusa_service" {
  name            = "medusa-service"
  cluster         = aws_ecs_cluster.medusa_cluster.id
  task_definition = aws_ecs_task_definition.medusa_task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets = aws_subnet.public[*].id  #To use all defined subnets

    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
  }
}

# ECR Repository docker storage
resource "aws_ecr_repository" "medusa" {
  name = "medusa-backend"
}
