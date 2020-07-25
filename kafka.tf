data "aws_msk_cluster" "core-infra-kafka" {
    cluster_name = "core-infra-kafka"
}

resource "aws_msk_cluster" "core-infra-kafka" {

    cluster_name = "core-infra-kafka"
    kafka_version = "1.1.1"
    number_of_broker_nodes = 3

    broker_node_group_info {
      instance_type = "kafka.m5.large"
      ebs_volume_size = 30
      client_subnets = module.vpc-west.private_subnets
      security_groups = aws_security_group.allow_ssh.id
    }

}
