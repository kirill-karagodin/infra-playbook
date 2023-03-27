resource "yandex_compute_instance" "prod-node1" {
  name                      = "${var.prod-node1}"
  zone                      = "${var.zone-prod}"
  hostname                  = "${var.prod-node1}.netology.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = "${var.node_cores}"
    memory = "${var.node_memory}"
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.image_node}"
      name        = "root-${var.prod-node1}"
      type        = "network-nvme"
      size        = "${var.node_hdd}"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.prod.id}"
    nat       = false
    ip_address = "${var.ipv4_internals_prod-node1}"
  }

  metadata = {
    ssh-keys = "${var.user}:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "prod-node2" {
  name                      = "${var.prod-node2}"
  zone                      = "${var.zone-prod}"
  hostname                  = "${var.prod-node2}.netology.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = "${var.node_cores}"
    memory = "${var.node_memory}"
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.image_node}"
      name        = "root-${var.prod-node2}"
      type        = "network-nvme"
      size        = "${var.node_hdd}"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.prod.id}"
    nat       = false
    ip_address = "${var.ipv4_internals_prod-node2}"
  }

  metadata = {
    ssh-keys = "${var.user}:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "prod-node3" {
  name                      = "${var.prod-node3}"
  zone                      = "${var.zone-prod}"
  hostname                  = "${var.prod-node3}.netology.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = "${var.node_cores}"
    memory = "${var.node_memory}"
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.image_node}"
      name        = "root-${var.prod-node3}"
      type        = "network-nvme"
      size        = "${var.node_hdd}"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.prod.id}"
    nat       = false
    ip_address = "${var.ipv4_internals_prod-node3}"
  }

  metadata = {
    ssh-keys = "${var.user}:${file("~/.ssh/id_rsa.pub")}"
  }
}
