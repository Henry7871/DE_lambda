provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region                  = "ap-southeast-2"
  profile                 = "default"
}

data "local_file" "lambda_file" {
  filename = "${path.module}/main.py"

  provisioner "local-exec" {
    command = local.is_windows ? local.powershell_zip : local.bash_zip
  }

}

locals {
  is_windows = substr(pathexpand("~"), 0, 1) == "/" ? false : true
  lambda_function_zip = "${path.module}/prediction.zip"
}

locals {
  bash_zip           = "zip -r ${local.lambda_function_zip} ${data.local_file.lambda_file.filename} ;chmod 400 ${local.lambda_function_zip}"
  powershell_zip     = "Compress-Archive -Path ${data.local_file.lambda_file.filename} -DestinationPath ${local.lambda_function_zip} ;icacls ${local.key_file}/inheritancelevel:r /grant:r andy:R"
}

resource "aws_s3_bucket_object" "object" {
  bucket = var.s3_bucket
  key    = "v${var.app_version}/example.zip"
  source = local.lambda_function_zip

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5(local.lambda_function_zip)

  depends_on = [data.local_file.lambda_file]
}