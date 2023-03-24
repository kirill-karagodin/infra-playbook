resource "yandex_compute_instance" "jenkins-master" {
  name                      = "jenkins-master"
  zone                      = "ru-central1-a"
  hostname                  = "jenkins-master.netology.yc"
  allow_stopping_for_update = true

  resources {
    cores  = "${var.instance_cores}"
    memory = "${var.instance_memory}"
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.image_instance}"
      name        = "root-${var.jenkins-master}"
      type        = "network-nvme"
      size        = "${var.instance_hdd}"
    }
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.group-1.id}"
    nat        = true
	ip_address = "${var.ipv4_internals_jenkins-master}"
  }

  metadata = {
    ssh-keys = "${var.user}:${file("~/.ssh/id_rsa.pub")}"
  }
}
