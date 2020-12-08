resource "aws_ecr_repository" "helloworld" {
  name = "helloworld"

  image_scanning_configuration {
    scan_on_push = true
  }
}
