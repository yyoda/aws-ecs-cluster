#
# EC2 role settings
#
resource "aws_iam_role" "ecs_instance_role" {
    name = "${var.cluster_name}-ec2"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "ecs_instance_role_attach" {
    name = "${var.cluster_name}-ec2"
    roles = ["${aws_iam_role.ecs_instance_role.name}"]
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "ecs_instance_profile" {
    name = "${var.cluster_name}-ec2"
    role = "${aws_iam_role.ecs_instance_role.name}"
}

resource "aws_iam_role_policy" "ecs_instance_role_policy" {
    name = "${var.cluster_name}-ec2"
    role = "${aws_iam_role.ecs_instance_role.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "ecs:*",
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": [
          "arn:aws:s3:::${var.cluster_name}",
          "arn:aws:s3:::${var.cluster_name}/*"
      ]
    }
  ]
}
EOF
}

#
# ECS role settings
#
resource "aws_iam_role" "ecs_service_role" {
    name = "${var.cluster_name}-ecs"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ecs.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "ecs_service_role_attach" {
    name = "${var.cluster_name}-ecs"
    roles = ["${aws_iam_role.ecs_service_role.name}"]
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}

resource "aws_iam_instance_profile" "ecs_service_profile" {
    name = "${var.cluster_name}-ecs"
    role = "${aws_iam_role.ecs_service_role.name}"
}

resource "aws_iam_role_policy" "ecs_service_role_policy" {
    name = "${var.cluster_name}-ecs"
    role = "${aws_iam_role.ecs_service_role.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "ecs:*",
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
