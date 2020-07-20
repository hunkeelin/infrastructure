module "core-infra-es" {
  source = "git::https://github.com/cloudposse/terraform-aws-elasticsearch.git?ref=master"
  name = "core-infra-es"
  vpc_id = module.vpc-west.vpc_id
  subnet_ids = module.vpc-west.private_subnets
  instance_type = "t2.micro.elasticsearch" 
  encrypt_at_rest_enabled = true
}

