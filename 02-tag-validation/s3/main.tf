resource "random_id" "s3_id" {
  byte_length = 2
}

resource "aws_s3_bucket" "team-bucket" {
  bucket = "${var.tags["Team"]}-bucket-${random_id.s3_id.dec}"

  tags = var.tags
}