# Network
resource "yandex_vpc_network" "project" {
  name = "net"
}

# Сеть сервров управления
resource "yandex_vpc_subnet" "group-1"   {
  name = "group-1"
  zone           = "${var.zone-group-1}"
  network_id     = "${yandex_vpc_network.project.id}"
  v4_cidr_blocks = ["10.200.80.0/28"]
}

# Сеть k8s stage контура
resource "yandex_vpc_subnet" "stage"   {
  name = "stage"
  zone           = "${var.zone-stage}"
  network_id     = "${yandex_vpc_network.project.id}"
  v4_cidr_blocks = ["10.200.100.0/27"]
}

# Сеть k8s prod контура
resource "yandex_vpc_subnet" "prod"   {
  name = "prod"
  zone           = "${var.zone-prod}"
  network_id     = "${yandex_vpc_network.project.id}"
  v4_cidr_blocks = ["10.200.110.0/27"]
}


