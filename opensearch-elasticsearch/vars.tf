# Módulo do cluster do OpenSearch
variable "domain_name" {
  default = "elasticsearch-opensearch-prd"
}

variable "custom_endpoint" {
  default = "elasticsearch.MYDOMAINNAME.com.br"
}

variable "custom_endpoint_certificate_arn" {
  default = "arn:aws:acm:us-east-1:MYACCOUNTID:certificate/xxxxxxxx-xxxx-4da0-9348-xxxxxxxxxxx"
}

variable "engine_version" {
  type = string
  # Kind of engine, select between OpenSearch or ElasticSearch
  #default = "OpenSearch_2.5"
  default = "Elasticsearch_7.10"
}

variable "instance_type" {
  default = "t3.small.search"
}

variable "instance_count" {
  type = string
  default = "3"
}

variable "dedicated_master_type" {
  type = string
  default = "t3.small.search"
}

variable "dedicated_master_count" {
  type = number
  default = "1"
}

variable "data_node_storage_size" {
  type = number
  default = "20"
}

variable "master_node_instance_type" {
  default = "t3.small.search"
}

variable "master_node_count" {
  type = number
  default = "1"
}

variable "vpc_id" {
  type = string
  default = "vpc-04fe747axxxxxxxxx"
}

variable "subnet_ids" {
  type = list(string)
  # Private Subnets IDs
  default = ["subnet-08b96bfxxxxxxxxxx", "subnet-0b84665xxxxxxxxxx", "subnet-0fc6ecbxxxxxxxxxx"]
}

variable "default_tags" {
  type = map
  default = {
    accountId     = "MYACCOUNTID"
    application   = "elasticSearch"
    environment   = "prd"
    network       = "private"
    region        = "us-east-1"
    services      = "amazonOpensearchService"
    terraform     = "true"
  }
}

## Módulo do Security Group
# Range networks for security group
variable "cidr_blocks" {
  type = list(string)
  default = ["10.0.0.0/16"]
}
