resource "aws_cloudfront_distribution" "root_distribution" {
  origin {
    domain_name = aws_s3_bucket.root_bucket.website_endpoint
    origin_id   = "S3-.${var.bucket_name}"
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }
