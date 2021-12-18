module "myApp" {
  source = "./services/prediction"
  app_version = var.app_version
}

provider "aws" {
  region                  = "ap-southeast-2"
  shared_credentials_file = "/Users/henry/.aws/credentials"
  profile                 = "default"
}
