
resource "aws_s3_bucket" "jenkins_g_test" {
  bucket        = "jenkinstestwillocks"
  force_destroy = false
  

  tags = {
    Name = "Jenkins Continuation Bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "jenkins_g_test_pab" {
  bucket                  = aws_s3_bucket.jenkins_g_test.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "jenkins_g_test_public_read" {
  bucket = aws_s3_bucket.jenkins_g_test.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.jenkins_g_test.arn}/*"
      }
    ]
  })
}

resource "aws_s3_object" "readme_upload" {
  bucket       = aws_s3_bucket.jenkins_g_test.id
  key          = "README.md"
  source       = "${path.module}/README.md"
  etag         = filemd5("${path.module}/README.md")
  content_type = "text/markdown"
}

resource "aws_s3_object" "newly_created_pipeline_upload" {
  bucket       = aws_s3_bucket.jenkins_g_test.id
  key          = "jenkins_pipeline_newlycreated.png"
  source       = "${path.module}/jenkins_pipeline_newlycreated.png"
  etag         = filemd5("${path.module}/jenkins_pipeline_newlycreated.png")
  content_type = "image/png"
}

resource "aws_s3_object" "pipeline_trigger_upload" {
  bucket       = aws_s3_bucket.jenkins_g_test.id
  key          = "jenkins_pipeline_trigger.png"
  source       = "${path.module}/jenkins_pipeline_trigger.png"
  etag         = filemd5("${path.module}/jenkins_pipeline_trigger.png")
  content_type = "image/png"
}

resource "aws_s3_object" "pipeline_trigger_details_upload" {
  bucket       = aws_s3_bucket.jenkins_g_test.id
  key          = "jenkins_pipeline_trigger_details.png"
  source       = "${path.module}/jenkins_pipeline_trigger_details.png"
  etag         = filemd5("${path.module}/jenkins_pipeline_trigger_details.png")
  content_type = "image/png"
}

resource "aws_s3_object" "pipeline_trigger_status_upload" {
  bucket       = aws_s3_bucket.jenkins_g_test.id
  key          = "jenkins_pipeline_status.png"
  source       = "${path.module}/jenkins_pipeline_status.png"
  etag         = filemd5("${path.module}/jenkins_pipeline_status.png")
  content_type = "image/png"
}
