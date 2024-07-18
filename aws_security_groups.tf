resource "aws_security_group" "bia_dev" {
  name        = "bia-dev"
  description = "acesso da bia dev"
  vpc_id      = local.vpc_id

  ingress {
    description = "acesso geral"
    from_port   = 3001
    to_port     = 3001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "bia-web" {
  name        = "bia-web"
  description = "acesso da bia web"
  vpc_id      = local.vpc_id

  ingress {
    description = "liberado geral"
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
    self        = false
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = false
  }
}

resource "aws_security_group" "bia-alb" {
  name        = "bia-alb"
  description = "acesso do bia-alb"
  vpc_id      = local.vpc_id

  ingress {
    description = "liberado para o mundo"
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
    self        = false
  }

  ingress {
    description = "liberado para o mundo"
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
    self        = false
  }

  ingress {
    description = "ping liberado"
    protocol    = "icmp"
    from_port   = -1
    to_port     = -1
    cidr_blocks = ["0.0.0.0/0"]
    self        = false
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "bia-ec2" {
  name        = "bia-ec2"
  description = "acesso do bia-ec2"
  vpc_id      = local.vpc_id

  ingress {
    description     = "acesso do bia-alb"
    protocol        = "tcp"
    from_port       = 0
    to_port         = 65535
    security_groups = [aws_security_group.bia-alb.id]
    self            = false
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "bia-db" {
  name        = "bia-db"
  description = "acesso do banco"
  vpc_id      = local.vpc_id

  ingress {
    description     = "acesso do bia-web"
    protocol        = "tcp"
    from_port       = 5432
    to_port         = 5432
    security_groups = [aws_security_group.bia-web.id]
    self            = false
  }

  ingress {
    description     = "acesso do bia-dev"
    protocol        = "tcp"
    from_port       = 5432
    to_port         = 5432
    security_groups = [aws_security_group.bia_dev.id]
    self            = false
  }

  ingress {
    description     = "acesso do bia-ec2"
    protocol        = "tcp"
    from_port       = 5432
    to_port         = 5432
    security_groups = [aws_security_group.bia-ec2.id]
    self            = false
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
