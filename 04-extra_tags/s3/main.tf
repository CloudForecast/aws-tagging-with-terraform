		locals {
		  tags = merge({
		    Service = var.service
		    Team = var.team
		  }, var.extra_tags)
}

resource "random_id" "s3_id" {
  byte_length = 2
}

resource "aws_s3_bucket" "team-bucket" {
  bucket = "${lower(var.team)}-bucket-${random_id.s3_id.dec}"

  tags = local.tags
}