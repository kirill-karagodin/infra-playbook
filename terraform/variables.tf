#########################################################
# Default

variable "yandex_cloud_id" {
  default = "b1g60ss3hrn8qqmiode2"
}
variable "yandex_folder_id" {
  default = "b1gpur6h6nm983ia1ljb"
}
variable "pr-sa-bucket" {
  default = "ajes0eik3ql9srn70mgr"
}
variable "zone" {
  default = "ru-central1-a"
}
# User
variable "user" {
  default = "centos"
}
#########################################################
# Group-1

# Name Nginx
variable "nginx-bl" {
  default = "nginx-bl"
}
# Name Jenkins Master
variable "jenkins-master" {
  default = "jenkins-master"
}
# Name Jenkins Agent Prod
variable "prod-agent1" {
  default = "prod-agent1"
}
# Name Jenkins Agent Stage
variable "stage-agent1" {
  default = "stage-agent1"
}
# Name Grafana
variable "grafana" {
  default = "grafana"
}

# Image for all servers
variable "image_instance" {
  default = "fd88d14a6790do254kj7"
}
# CPU core
variable "instance_cores" {
  default = "2"
}
# CPU ram (Gb)
variable "instance_memory" {
  default = "4"
}
# HDD space (Gb)
variable "instance_hdd" {
  default = "10"
}
# CPU core agent
variable "agent_cores" {
  default = "2"
}
# CPU ram agent (Gb)
variable "agent_memory" {
  default = "4"
}
# HDD space agent (Gb)
variable "agent_hdd" {
  default = "10"
}

# Group-1 zone
variable "zone-group-1" {
  default = "ru-central1-a"
}

# IP adress for nginx
variable "ipv4_internals_nginx-bl" {
  default = "10.200.80.3"
}
# IP adress for Jenkins-master
variable "ipv4_internals_jenkins-master" {
  default = "10.200.80.4"
}
# IP adress for prod jenkins-agent
variable "ipv4_internals_prod-agent1" {
  default = "10.200.80.5"
}
# IP adress for stage jenkins-agent
variable "ipv4_internals_stage-agent1" {
  default = "10.200.80.6"
}
# IP adress for grafana
variable "ipv4_internals_grafana" {
  default = "10.200.80.7"
}

#########################################################
# K8S (stage + prod)

# Image for all k8s nodes
variable "image_node" {
  default = "fd88d14a6790do254kj7"
}
# CPU core
variable "node_cores" {
  default = "2"
}
# CPU ram (Gb)
variable "node_memory" {
  default = "4"
}
# HDD space (Gb)
variable "node_hdd" {
  default = "10"
}
#########################################################
# K8S Prod

# Name prod_node1
variable "prod-node1" {
  default = "prod-node1"
}
# Name prod_node2
variable "prod-node2" {
  default = "prod-node2"
}
# Name prod_node3
variable "prod-node3" {
  default = "prod-node3"
}

variable "zone-prod" {
  default = "ru-central1-a"
}

# IP adress for prod node 1
variable "ipv4_internals_prod-node1" {
  default = "10.200.110.11"
}
# IP adress for prod node 2
variable "ipv4_internals_prod-node2" {
  default = "10.200.110.12"
}
# IP adress for prod node 3
variable "ipv4_internals_prod-node3" {
  default = "10.200.110.13"
}

#########################################################
# K8S Stage IP 

# Name stage-node1
variable "stage-node1" {
  default = "stage-node1"
}
# Name stage-node2
variable "stage-node2" {
  default = "stage-node2"
}
# Name stage-node3
variable "stage-node3" {
  default = "stage-node3"
}

variable "zone-stage" {
  default = "ru-central1-a"
}

# IP adress for stage node 1
variable "ipv4_internals_stage-node1" {
  default = "10.200.100.11"
}
# IP adress for prod node 2
variable "ipv4_internals_stage-node2" {
  default = "10.200.100.12"
}
# IP adress for prod node 3
variable "ipv4_internals_stage-node3" {
  default = "10.200.100.13"
}
