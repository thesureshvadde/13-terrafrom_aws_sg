variable "sg_name" {
  type = string
}

variable "sg_description" {
  type = string
}

variable "common_tags" {
  type = map
}

variable "project_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "ingress" {
  type = list
  default = []
}