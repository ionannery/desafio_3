resource "aws_lb" "bia" {
  name               = "bia-alb"
  load_balancer_type = "application"
  subnets            = [local.subnet_zone_a, local.subnet_zone_b]
  security_groups    = [aws_security_group.bia-alb.id]
}

resource "aws_lb_target_group" "tg-bia" {
  name_prefix          = "tgbia-"
  vpc_id               = local.vpc_id
  protocol             = "HTTP"
  port                 = 80
  target_type          = "instance"
  deregistration_delay = 30

  health_check {
    enabled             = true
    path                = "/api/versao"
    matcher             = 200
    interval            = 10
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 3
  }
}

resource "aws_lb_listener" "bia" {
  load_balancer_arn = aws_lb.bia.id
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-bia.id
  }
}

resource "aws_lb_listener" "bia_https" {
  load_balancer_arn = aws_lb.bia.id
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.certificate.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-bia.id
  }
}
