resource "random_id" "s3_id" {
  byte_length = 2
}

resource "aws_s3_bucket" "team-bucket" {
  bucket = "${lower(var.team)}-bucket-${random_id.s3_id.dec}"

  tags = {
    Service = var.service
    Team = var.team
  }
}