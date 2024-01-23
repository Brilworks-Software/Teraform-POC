/*
 * Terraform CloudFront module
 *
 * Creates a CloudFront distribution for a static website
 *
 * Usage:
 *
 * module "cloudfront" {
 *   source = "./modules/cloudfront"
 *   bucket_name = "${aws_s3_bucket.s3_bucket.id}"
 *   aws_region = "${var.aws_region}"
 *   index_document = "${var.index_document}"
 * }
 *
 * Outputs:
 *
 * cloudfront_url = ${aws_cloudfront_distribution.cdn_static_website.domain_name}
 *
 */
locals {
  s3_origin_id   = "${var.bucket_name}-origin"
  s3_domain_name = "${var.bucket_name}.s3-website-${var.aws_region}.amazonaws.com"
}

# Create a CloudFront distribution
resource "aws_cloudfront_distribution" "cdn_static_website" {
  enabled             = true
  comment             = "Static Website Distribution"
  default_root_object = var.index_document


  origin {
    domain_name              = aws_s3_bucket.s3_bucket.bucket_regional_domain_name
    origin_id                = aws_s3_bucket.s3_bucket.id
    origin_access_control_id = aws_cloudfront_origin_access_control.default.id
  }

  default_cache_behavior {
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0

    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.s3_bucket.id


    forwarded_values {
      query_string = false
      cookies {
        forward = "all"
      }
    }
  }

  restrictions {
    geo_restriction {
      locations        = []
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

# Create an origin access identity
resource "aws_cloudfront_origin_access_control" "default" {
  name                              = "s3-access"
  description                       = "s3-access"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

# Output the CloudFront distribution URL
output "cloudfront_url" {
  value = aws_cloudfront_distribution.cdn_static_website.domain_name
}
