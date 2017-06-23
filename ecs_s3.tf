resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.cluster_name}"
  acl = "private"
  force_destroy = "true"
}
