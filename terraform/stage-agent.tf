resource "yandex_compute_instance" "stage-agent1" {
  name                      = "stage-agent1"
  zone                      = "${var.zone-stage}"
  hostname                  = "stage-agent1.netology.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = "${var.agent_cores}"
    memory = "${var.agent_memory}"
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.image_instance}"
      name        = "root-stage-agent"
      type        = "network-nvme"
      size        = "${var.agent_hdd}"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.group-1.id}"
    nat       = true
	ip_address = "${var.ipv4_internals_stage-agent1}"
  }

  metadata = {
    ssh-keys = "${var.user}:${file("~/.ssh/id_rsa.pub")}"
  }
}
