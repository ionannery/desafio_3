resource "aws_route53_zone" "ionannery-cloud" {
  name = "ionannery.cloud"
}

resource "aws_route53_record" "www-ionannery-cloud" {
  zone_id = aws_route53_zone.ionannery-cloud.id
  name    = "bia.ionannery.cloud"
  type    = "CNAME"
  ttl     = 300
  records = ["bia-alb-2075207910.us-east-1.elb.amazonaws.com"]
}
