data "terraform_remote_state" "vpc" {
  backend = "s3" 
  config  = {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "zhivarev"
    region = "ru-central1"
    key    = "terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true # Необходимая опция при описании бэкенда для Terraform версии старше 1.6.1.

    access_key = "XXX"
    secret_key = "XXX"

   }
 }