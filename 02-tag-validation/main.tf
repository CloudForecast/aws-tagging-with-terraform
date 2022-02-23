# create module and pass tags into modules
# validate those tags are all there using the "for t in tags"

module "finance-bucket" {
  count  = 1
  source = "./s3"
  tags = {
    Team    = "finance"
    Env     = "dev"
    Service = "s3"
  }
}

module "dev-bucket" {
  count  = 1
  source = "./s3"
  tags = {
    Team    = "development"
    Env     = "dev"
    Service = "s3"
  }
}