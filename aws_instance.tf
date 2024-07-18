resource "aws_instance" "bia-dev" {
  ami           = "ami-06c68f701d8090592"
  instance_type = "t3.micro"
  tags = {
    ambiente = "dev"
    Name     = var.instance_name
  }

  vpc_security_group_ids = [aws_security_group.bia_dev.id]

  root_block_device {
    volume_size = 12
  }

  iam_instance_profile = aws_iam_instance_profile.role_acesso_ssm.name
  user_data            = file("userdata.sh")
}
