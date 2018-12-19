resource "aws_route53_zone" "901runner-com" {
  name = "901runner.com."
}

resource "aws_route53_record" "901runner-com-cname" {
  name    = ""
  type    = "A"
  zone_id = "${aws_route53_zone.901runner-com.zone_id}"

  alias {
    evaluate_target_health = false
    name                   = "${aws_s3_bucket.901runner-com.website_domain}"
    zone_id                = "${aws_s3_bucket.901runner-com.hosted_zone_id}"
  }
}

resource "aws_s3_bucket" "901runner-com" {
  bucket = "901runner.com"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}
