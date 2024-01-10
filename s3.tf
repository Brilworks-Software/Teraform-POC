/*
 * Terraform configuration file to create S3 bucket
 * and configure it as a static website
 */

/*
  * S3 bucket name
  */
resource "aws_s3_bucket" "s3_bucket" {
  bucket        = var.bucket_name
  force_destroy = true
}
/*
 * Bucket access block configuration
 */
resource "aws_s3_bucket_public_access_block" "s3_bucket_access" {
  bucket                  = aws_s3_bucket.s3_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

/*
 * Upload index file to S3 bucket
 */
resource "aws_s3_object" "upload_index_file" {
  bucket = aws_s3_bucket.s3_bucket.id
  key    = var.index_file_name
  source = var.index_file_path
  etag   = filemd5(var.index_file_path)
}

/*
 * Configure S3 bucket as a static website
 */
resource "aws_s3_bucket_website_configuration" "s3_bucket_configuration" {
  bucket = aws_s3_bucket.s3_bucket.bucket

  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }

}

/*
 * Create IAM policy to allow CloudFront to access S3 bucket
 */
data "aws_iam_policy_document" "s3_bucket_policy_document" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.s3_bucket.arn}/*"]
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values   = ["${aws_cloudfront_distribution.cdn_static_website.arn}"]
    }
  }
}

/*
 * Attach IAM policy to S3 bucket
 */
resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = data.aws_iam_policy_document.s3_bucket_policy_document.json
}
