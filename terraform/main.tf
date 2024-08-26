resource "yandex_vpc_network" "net" {
  name = "develop"
}

resource "yandex_vpc_subnet" "subnets-master" {
  name           = "subnet-master"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.net.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_vpc_subnet" "subnets" {
  count          = 3
  name           = "subnet-${var.subnet[count.index]}"
  zone           = "${var.subnet[count.index]}"
  network_id     = "${yandex_vpc_network.net.id}"
  v4_cidr_blocks = [ "${var.cidr[count.index]}" ]
}
