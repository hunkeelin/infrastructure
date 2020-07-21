module "core-infra-es" {
  source = "git::https://github.com/cloudposse/terraform-aws-elasticsearch.git?ref=master"
  name = "core-infra-es"
  vpc_id = module.vpc-west.vpc_id
  subnet_ids = module.vpc-west.private_subnets
  instance_type = "m5.large.elasticsearch"
  instance_count = 2  
  encrypt_at_rest_enabled = true
  zone_awareness_enabled  = "true"


  ebs_options = {
    ebs_enabled = "true"
    volume_size = "12"
  }
}


