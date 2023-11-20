# Módulo do cluster do OpenSearch
variable "domain_name" {
  type = string
}

variable "custom_endpoint" {
  type = string
}

variable "custom_endpoint_certificate_arn" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "dedicated_master_type" {
  type = string
}

variable "dedicated_master_count" {
  type = number
}

variable "data_node_storage_size" {
  type = number
}

variable "master_node_instance_type" {
  type = string
}

variable "master_node_count" {
  type = number
}

variable "master_user_name" {
  type = string
}

variable "master_user_password" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

## Security Group Module

variable "cidr_blocks" {
  type = list(string)
}

variable "name_prefix" {
  type = string
}

#variable "access_policies" {
#  type = string
#}

variable "default_tags" {
  type = map
}
