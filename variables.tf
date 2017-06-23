variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "ap-northeast-1"
}

variable "ssh_key_name" {}

variable "subnet" {}
variable "securiy_group" {}

variable "aws_amis" {
  default = {
      "ap-northeast-1" = "ami-fd10059a"
  }
}

variable "instance_type" {
  default = "t2.micro"
}

variable "cluster_name" {
  default = "ecs-linux-develop"
}

#ALB
variable vpc {}
variable subnet_lb1 {}
variable subnet_lb2 {}
variable security_group_lb {}
