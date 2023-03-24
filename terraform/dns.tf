resource "yandex_dns_zone" "zone1" {
  name        = "my-public-zone"
  description = "public zone"

  labels = {
    label1 = "public"
  }
  zone    = "karagodin-ka.ru."
  public  = true
}
resource "yandex_dns_recordset" "pr-web" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "web.karagodin-ka.ru."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.nginx-bl.network_interface.0.nat_ip_address}"]
}

resource "yandex_dns_recordset" "pr-test-web" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "test-web.karagodin-ka.ru."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.nginx-bl.network_interface.0.nat_ip_address}"]
}

resource "yandex_dns_recordset" "pr-grafana" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "grafana.karagodin-ka.ru."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.nginx-bl.network_interface.0.nat_ip_address}"]
}

resource "yandex_dns_recordset" "pr-jenkins" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "jenkins.karagodin-ka.ru."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.nginx-bl.network_interface.0.nat_ip_address}"]
}

resource "yandex_dns_recordset" "k8s-board" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "k8s-board.karagodin-ka.ru."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.nginx-bl.network_interface.0.nat_ip_address}"]
}


resource "yandex_dns_recordset" "test-k8s-board" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "test-k8s-board.karagodin-ka.ru."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.nginx-bl.network_interface.0.nat_ip_address}"]
}


