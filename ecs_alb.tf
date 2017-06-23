resource "aws_alb" "default" {
  name            = "${var.cluster_name}-alb"
  subnets         = ["${var.subnet_lb1}", "${var.subnet_lb2}"]
  security_groups = ["${var.security_group_lb}"]
}

resource "aws_alb_target_group" "default" {
  name     = "${var.cluster_name}-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc}"
}

resource "aws_alb_listener" "default" {
  load_balancer_arn = "${aws_alb.default.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.default.id}"
    type             = "forward"
  }
}
