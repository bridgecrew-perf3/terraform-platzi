variable "ami_id" {
}

variable "instance_type" {
  type = string
}

variable "tags" {
  type = map(any)
}

variable "sg_name" {}

variable "ingress_rules" {}

variable "egress_rules" {}

variable "private_key" {}