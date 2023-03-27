resource "yandex_lb_network_load_balancer" "prod-lb" {
  name = "lb-prod"
  type = "internal"

  listener {
    name = "lb-listener"
    port = 80
    internal_address_spec {
      subnet_id = "${yandex_vpc_subnet.prod.id}"
      ip_version = "ipv4"
    }
  }
    attached_target_group {
    target_group_id = "${yandex_lb_target_group.ptg.id}"

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
  depends_on = [
    yandex_lb_target_group.ptg
]
}

resource "yandex_lb_network_load_balancer" "stage-lb" {
  name = "lb-stage"
  type = "internal"

  listener {
    name = "lb-listener"
    port = 80
    internal_address_spec {
      subnet_id = "${yandex_vpc_subnet.stage.id}"
      ip_version = "ipv4"
    }
  }
    attached_target_group {
    target_group_id = "${yandex_lb_target_group.stg.id}"

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
  depends_on = [
    yandex_lb_target_group.stg
]
}
