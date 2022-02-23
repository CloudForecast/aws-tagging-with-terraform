# create module and pass tags into modules
# validate those tags are all there using the "for t in tags"

module "finance-bucket" {
  count   = 2
  source  = "./s3"
  service = "s3"
  team    = "finance"
}

module "dev-bucket" {
  count   = 1
  source  = "./s3"
  service = "s3"
  team    = "development"
}