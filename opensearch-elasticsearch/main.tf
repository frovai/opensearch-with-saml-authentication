terraform {
  backend "s3" {}
}

# Módulo do cluster do OpenSearch
module "opensearch_cluster" {
  source = "../modules/opensearch-elasticsearch"

  domain_name  = var.domain_name
  custom_endpoint = var.custom_endpoint
  custom_endpoint_certificate_arn = var.custom_endpoint_certificate_arn
  engine_version = var.engine_version
  instance_type = var.instance_type
  instance_count = var.instance_count
  dedicated_master_count   = var.dedicated_master_count
  dedicated_master_type    = var.dedicated_master_type  
  data_node_storage_size = var.data_node_storage_size 
  master_node_instance_type = var.master_node_instance_type
  master_node_count = var.master_node_count
  vpc_id = var.vpc_id
  subnet_ids = var.subnet_ids
  cidr_blocks = var.cidr_blocks
  default_tags = var.default_tags
}