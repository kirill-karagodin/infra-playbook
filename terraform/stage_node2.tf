resource "yandex_compute_instance" "stage-node2" {
  name                      = "${var.stage-node2}"
  zone                      = "${var.zone-stage}"
  hostname                  = "${var.stage-node2}.netology.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = "${var.node_cores}"
    memory = "${var.node_memory}"
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.image_node}"
      name        = "root-${var.stage-node2}"
      type        = "network-nvme"
      size        = "${var.node_hdd}"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.stage.id}"
    nat       = false
    ip_address = "${var.ipv4_internals_stage-node2}"
  }

  metadata = {
    ssh-keys = "${var.user}:${file("~/.ssh/id_rsa.pub")}"
  }
}
