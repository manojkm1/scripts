resource "aws_ecs_cluster" "cluster" {
  name = "ecs-cluster"
    
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}