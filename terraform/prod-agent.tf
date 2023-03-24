resource "yandex_compute_instance" "prod-agent1" {
  name                      = "${var.prod-agent1}"
  zone                      = "${var.zone-prod}"
  hostname                  = "prod-agent1.netology.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = "${var.agent_cores}"
    memory = "${var.agent_memory}"
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.image_instance}"
      name        = "root-prod-agent"
      type        = "network-nvme"
      size        = "${var.agent_hdd}"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.group-1.id}"
    nat       = true
	ip_address = "${var.ipv4_internals_prod-agent1}"
  }

  metadata = {
    ssh-keys = "${var.user}:${file("~/.ssh/id_rsa.pub")}"
  }
}
