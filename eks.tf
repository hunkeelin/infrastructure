data "aws_eks_cluster" "cluster" {

  name = module.core-infra-eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.core-infra-eks.cluster_id
}

module "core-infra-eks" {
  source          = "git::https://github.com/terraform-aws-modules/terraform-aws-eks"
  cluster_name    = "infra-west-eks"
  cluster_version = "1.17"
  subnets         = module.vpc-west.private_subnets
  vpc_id          = module.vpc-west.vpc_id
  map_roles = [
    {
      rolearn  = var.devops_admin_arn
      username = "devops-admin"
      groups   = ["system:masters"]
    },
    {
      rolearn  = module.core-infra-eks.worker_iam_role_arn
      username = "system:node:{{EC2PrivateDNSName}}"
      groups   = ["system:nodes", "system:bootstrappers"]
    }
  ]
  worker_groups_launch_tempalte = [
    {
      instance_type = "m5.large"
<<<<<<< HEAD
      asg_max_size = 4
      asg_desired_capacity = 2
      public_ip = true 
        
=======
      asg_max_size = 3
      asg_desired_capacity = 2 
      
>>>>>>> 8322bd5c44d2f2f4202f56f6cf58d6b18dcac9cb
    }

  ]
}
variable devops_admin_arn {
  description = "The arn of the devops admin access account"
}


resource "aws_autoscaling_policy" "eks-asg-policy" {
  name                   = "eks-asg-policy"
  autoscaling_group_name = module.core-infra-eks.workers_asg_names[0]
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }

  adjustment_type        = "ChangeInCapacity"
  policy_type            = "TargetTrackingScaling"
}


