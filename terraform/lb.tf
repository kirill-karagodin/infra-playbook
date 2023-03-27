resource "yandex_lb_network_load_balancer" "prod-lb" {
  name = "lb-prod"

  listener {
    name = "lb-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }
    attached_target_group {
    target_group_id = yandex_lb_target_group.ptg.load_balancer[0].target_group_id

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

  listener {
    name = "lb-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }
    attached_target_group {
    target_group_id = yandex_lb_target_group.stg.load_balancer[0].target_group_id

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