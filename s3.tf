
resource "aws_s3_bucket" "jenkins_g_test" {
  bucket = "jenkinstestwillocks"
  force_destroy = false
  

  tags = {
    Name = "Jenkins Continuation Bucket"
  }
}


resource "aws_s3_bucket_public_access_block" "satellite_alb_logs_pab01" {
  bucket                  = aws_s3_bucket.jenkins_g_test.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
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