resource "yandex_compute_instance" "grafana" {
  name                      = "${var.grafana}"
  zone                      = "ru-central1-a"
  hostname                  = "${var.grafana}.netology.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = "${var.instance_cores}"
    memory = "${var.instance_memory}"
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.image_instance}"
      name        = "root-${var.grafana}"
      type        = "network-nvme"
      size        = "${var.instance_hdd}"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.group-1.id}"
    nat       = true
    ip_address = "${var.ipv4_internals_grafana}"
  }

  metadata = {
    ssh-keys = "${var.user}:${file("~/.ssh/id_rsa.pub")}"
  }
}