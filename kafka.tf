# data "aws_msk_cluster" "core-infra-kafka" {
#     cluster_name = "core-infra-kafka"
# }
# 
# resource "aws_msk_cluster" "core-infra-kafka" {
# 
#     cluster_name = "core-infra-kafka"
#     kafka_version = "1.1.1"
#     number_of_broker_nodes = 3
# 
#     broker_node_group_info {
#       instance_type = "kafka.m5.large"
#       ebs_volume_size = 30
#       client_subnets = module.vpc-west.private_subnets
#       security_groups = aws_security_group.allow_ssh.id
#     }
# 
# }

module "msk" { 
    source = "git::https://github.com/UKHomeOffice/acp-tf-msk-cluster?ref=master"
    name = "core-infra-kafka"
    kafka_version = "1.1.1"
    number_of_broker_nodes = "3"
    environment = var.dev 
    subnet_ids = module.vpc-west.private_subnets
    vpc_id = module.vpc-west.vpc_id
    ebs_volume_size = "7"
    msk_instance_type = "kafka.t3.small"
    
}

variable dev {
    description = "The environment the msk cluster is running in dev"
}
