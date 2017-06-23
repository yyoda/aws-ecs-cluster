resource "aws_ecs_task_definition" "app1" {
  family = "sample-app1"
  container_definitions = "${file("task-definitions/app1.json")}"
}

resource "aws_ecs_task_definition" "app2" {
  family = "sample-app2"
  container_definitions = "${file("task-definitions/app2.json")}"
}
