# Save .tfstate in bucket
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = yandex_storage_bucket.project-bucket.bucket
    region     = "ru-central1"
    key        = "s3/terraform.tfstate"
    access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
    secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

