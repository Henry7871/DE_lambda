module "myApp" {
  source = "./services/prediction"
  app_version = var.app_version
  s3_bucket_id = var.s3_bucket_id
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region                  = "ap-southeast-2"
  profile                 = "default"
}
