resource "yandex_compute_instance" "nginx-bl" {
  name                      = "${var.nginx-bl}"
  zone                      = "ru-central1-a"
  hostname                  = "${var.nginx-bl}.netology.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = "${var.instance_cores}"
    memory = "${var.instance_memory}"
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.image_instance}"
      name        = "root-${var.nginx-bl}"
      type        = "network-nvme"
      size        = "${var.instance_hdd}"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.group-1.id}"
    nat       = true
    ip_address = "${var.ipv4_internals_nginx-bl}"
  }

  metadata = {
    ssh-keys = "${var.user}:${file("~/.ssh/id_rsa.pub")}"
  }
}