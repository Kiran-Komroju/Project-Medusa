# ECS Execution Role
resource "aws_iam_role" "ecs_task_exe_role" {
  name = "ecs_task_exe_role"
 # Terraform's "jsonencode" function converts a
 # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
	{
      Action = "sts:AssumeRole"
	  Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
	  }
    ]
  })

  tags = {
    Name = "ecs-task-execution-role"
  }
}

resource "aws_iam_role_policy_attachment" "ecs_execution_attach" {
  role       = aws_iam_role.ecs_task_exe_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}