
resource "aws_s3_bucket" "jenkins_g_test" {
  bucket = "jenkinstestwillocks"
  force_destroy = true
  

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