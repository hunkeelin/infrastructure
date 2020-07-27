module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"
  version = "2.0.0"
  create = true
  name = "pongplanet-sqs-queue"
}
