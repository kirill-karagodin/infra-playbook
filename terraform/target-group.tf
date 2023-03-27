resource "yandex_lb_target_group" "ptg" {
  name      = "prod-target-group"

  target {
    subnet_id = "${yandex_vpc_subnet.prod.id}"
    address   = "${var.ipv4_internals_prod-node1}"
  }

  target {
    subnet_id = "${yandex_vpc_subnet.prod.id}"
    address   = "${var.ipv4_internals_prod-node2}"
  }
  target {
    subnet_id = "${yandex_vpc_subnet.prod.id}"
    address   = "${var.ipv4_internals_prod-node3}"
  }

}

resource "yandex_lb_target_group" "stg" {
  name      = "stage-target-group"

  target {
    subnet_id = "${yandex_vpc_subnet.stage.id}"
    address   = "${var.ipv4_internals_stage-node1}"
  }

  target {
    subnet_id = "${yandex_vpc_subnet.stage.id}"
    address   = "${var.ipv4_internals_stage-node2}"
  }
  target {
    subnet_id = "${yandex_vpc_subnet.stage.id}"
    address   = "${var.ipv4_internals_stage-node3}"
  }

}