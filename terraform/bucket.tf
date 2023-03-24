# Create Static Access Keys
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
    service_account_id = "${var.pr-sa-bucket}"
    description        = "static access key for bucket"
}

# Use keys to create bucket
resource "yandex_storage_bucket" "project-bucket" {
    access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
    secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
    bucket = "karagodin-project-bucket"
    acl    = "public-read"
}

# Add picture to bucket
resource "yandex_storage_object" "object-1" {
    access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
    secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
    bucket = yandex_storage_bucket.project-bucket.bucket
    key = "logo1.jpg"
    source = "data/logo1.jpg"
    acl    = "public-read"
    depends_on = [yandex_storage_bucket.project-bucket]
}

resource "yandex_storage_object" "object-2" {
    access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
    secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
    bucket = yandex_storage_bucket.project-bucket.bucket
    key = "logo2.jpg"
    source = "data/logo2.jpg"
    acl    = "public-read"
    depends_on = [yandex_storage_bucket.project-bucket]
}

