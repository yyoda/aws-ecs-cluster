resource "aws_ecs_cluster" "target" {
  name = "${var.cluster_name}"
}
