module "msk" { 
    source = "git::https://github.com/UKHomeOffice/acp-tf-msk-cluster?ref=master"
    name = "core-infra-kafka"
    kafka_version = "1.1.1"
    number_of_broker_nodes = "3"
    environment = var.certificateauthority 
    subnet_ids = module.vpc-west.private_subnets
    vpc_id = module.vpc-west.vpc_id
    ebs_volume_size = "7"
    msk_instance_type = "kafka.t3.small"
    
}

variable "certificateauthority" {
  description = "ARN of the AWS managed  CA  to attach to the MSK cluster"
}
