resource "aws_ecs_service" "app1" {
  name = "${var.cluster_name}-sample-app1"
  cluster = "${aws_ecs_cluster.target.id}"
  task_definition = "${aws_ecs_task_definition.app1.arn}"
  desired_count = 1

  iam_role = "${aws_iam_role.ecs_service_role.arn}"
  depends_on = ["aws_iam_role_policy.ecs_service_role_policy"]

  load_balancer {
    target_group_arn = "${aws_alb_target_group.default.id}"
    container_name   = "centos"
    container_port   = "80"
  }
}

resource "aws_ecs_service" "app2" {
  name = "${var.cluster_name}-sample-app2"
  cluster = "${aws_ecs_cluster.target.id}"
  task_definition = "${aws_ecs_task_definition.app2.arn}"
  desired_count = 1
}
