provider "aws" {
  region = "us-east-1"
}

resource "aws_opensearch_domain" "opensearch" {
  domain_name = var.domain_name
  engine_version = var.engine_version

  cluster_config {
    instance_type = var.instance_type
    instance_count = var.instance_count
    dedicated_master_count   = var.dedicated_master_count
    dedicated_master_type    = var.dedicated_master_type
    dedicated_master_enabled = false
    # Configuration to create separated Master-Nodes
    #dedicated_master_enabled = true
    
    zone_awareness_enabled = true

    # When the configuration above be true, need to use the configuration bellow and select more than 1 AZ

    zone_awareness_config {
      availability_zone_count = 3
    }  
  }

  # Enable when there was authentication by a Master user, so as not to leave it without authentication
  #advanced_security_options {
  #  #anonymous_auth_enabled         = (known after apply)
  #  enabled                        = true
  #  internal_user_database_enabled = true
#
  #    master_user_options {
  #      #master_user_arn      = (known after apply)
  #      master_user_name     = var.master_user_name
  #      master_user_password = var.master_user_password
  #  }
  #}

  domain_endpoint_options {
    custom_endpoint                 = var.custom_endpoint
    custom_endpoint_certificate_arn = var.custom_endpoint_certificate_arn
    custom_endpoint_enabled = true
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
  }

  ebs_options {
    ebs_enabled = true
    volume_size = var.data_node_storage_size
    volume_type = "gp3"
  }

  vpc_options {
    security_group_ids = [aws_security_group.opensearch.id]
    subnet_ids = var.subnet_ids
  }

  encrypt_at_rest {
    enabled = true
  }

  node_to_node_encryption {
    enabled = true
  }

  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }
  

  access_policies = <<CONFIG
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Action": "es:*",
                "Principal": "*",
                "Effect": "Allow",
                "Resource": "arn:aws:es:us-east-1:MYACCOUNTID:domain/${var.domain_name}/*"
            }
        ]
    }
    CONFIG
  tags = var.default_tags
}

resource "aws_security_group" "opensearch" {
  name_prefix = var.name_prefix
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }
}
