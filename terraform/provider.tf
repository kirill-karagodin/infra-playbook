# Provider
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "karagodin-project-bucket"
    region     = "ru-central1"
    key        = "terraform.tfstate"
    access_key = "YCAJEgWhukwPlmy7VCGduYfaT"
    secret_key = "YCMP423X7Vi2TSVMjJDj1yh2l_S1fOWF21svclAk"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id  = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
}
