resource "aws_cloudwatch_log_group" "this" {
  name_prefix       = "${var.name}-"
  retention_in_days = 1
}

resource "aws_ecs_task_definition" "this" {
  family = var.name

  container_definitions = jsonencode(
    [
      {
        name   = var.name
        image  = var.app_image
        cpu    = 0
        memory = 128
        portMappings = [
          {
            containerPort = var.app_port,
            hostPort      = var.app_port,
          }
        ]
        logConfiguration = {
          logDriver = "awslogs"
          options = {
            "awslogs-region"        = var.region
            "awslogs-group"         = aws_cloudwatch_log_group.this.name
            "awslogs-stream-prefix" = "ec2"
          }
        }
      }
    ]
  )
}

resource "aws_ecs_service" "this" {
  name            = var.name
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.this.arn

  desired_count = 1

  deployment_maximum_percent         = 100
  deployment_minimum_healthy_percent = 0
}
