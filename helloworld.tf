resource "aws_lb" "helloworld-alb" {
    name = "helloworld-alb"
    load_balancer_type = "application"
    security_groups = [aws_security_group.allow-http.id,aws_security_group.egress-all.id]
    subnets = module.vpc-west.public_subnets
}
resource "aws_security_group" "allow-http" {
    vpc_id = module.vpc-west.vpc_id
    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 80
        protocol =  "tcp"
        to_port = 80
    }
}
resource "aws_lb_target_group" "alb-tg" {
    name = "alb-tg"
    vpc_id = module.vpc-west.vpc_id
    port = "32002"
    protocol = "HTTP"
    health_check {
        protocol = "HTTP"
        port = "32002"
        path = "/"
    }
}
resource "aws_autoscaling_attachment" "asg_attachment" {
    autoscaling_group_name = "infra-west-eks-02020071820291195310000000d"
    alb_target_group_arn = aws_lb_target_group.alb-tg.arn
}

resource "aws_lb_listener" "helloworld-alb-listener" {
    load_balancer_arn = aws_lb.helloworld-alb.arn
    port = 80
    protocol = "HTTP"
    default_action {
        type = "forward"
            target_group_arn = aws_lb_target_group.alb-tg.arn
    }
}

resource "aws_security_group_rule" "helloworld-nodeport-sg" {
  description       = "Allow helloworld ingress"
  type              = "ingress"
  from_port         = 32002
  cidr_blocks       = "10.0.0.0/16"
  to_port           = 32002
  protocol          = "tcp"
  security_group_id = module.core-infra-eks.worker_security_group_id
}

