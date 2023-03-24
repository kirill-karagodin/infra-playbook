resource "yandex_compute_instance" "stage-node1" {
  name                      = "${var.stage-node1}"
  zone                      = "${var.zone-stage}"
  hostname                  = "${var.stage-node1}.netology.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = "${var.node_cores}"
    memory = "${var.node_memory}"
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.image_node}"
      name        = "root-${var.stage-node1}"
      type        = "network-nvme"
      size        = "${var.node_hdd}"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.stage.id}"
    nat       = false
    ip_address = "${var.ipv4_internals_stage-node1}"
  }

  metadata = {
    ssh-keys = "${var.user}:${file("~/.ssh/id_rsa.pub")}"
  }
}

