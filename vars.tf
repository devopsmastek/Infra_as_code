variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "ap-south-1"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    ap-south-1 = "ami-007d5db58754fa284"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "/home/ubuntu/terraform/key/terraformkeypair"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "/home/ubuntu/terraform/key/terraformkeypair.pub"
}
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
