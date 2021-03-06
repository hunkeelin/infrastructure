#resource "aws_iam_role" "cicd-service-role" {
#  name               = "cicd-service-role"
#  assume_role_policy = data.aws_iam_policy_document.assume-service-role-policy.json
#}
#
#data "aws_iam_policy_document" "assume-service-role-policy" {
#  statement {
#    actions = ["sts:AssumeRole"]
#
#    principals {
#      identifiers = ["ec2.amazonaws.com"]
#      type        = "Service"
#    }
#  }
#
#  statement {
#    actions = ["sts:AssumeRole"]
#
#    principals {
#      identifiers = [module.core-infra-eks.worker_iam_role_arn]
#      type        = "AWS"
#    }
#  }
#}
#
#resource "aws_iam_role" "default-service-role" {
#  name               = "default-service-role"
#  assume_role_policy = data.aws_iam_policy_document.assume-service-role-policy.json
#}
