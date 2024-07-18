data "aws_secretsmanager_secret" "bia_db" {
  arn = tolist(aws_db_instance.bia-db.master_user_secret)[0].secret_arn
}
