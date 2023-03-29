resource "local_file" "project" {
  content = <<-DOC
--- 
all:
  all:
  hosts:
    jenkins-master-01:
      ansible_host: ${yandex_compute_instance.jenkins-master.network_interface.0.nat_ip_address}
    jenkins-agent-stage:
      ansible_host: ${yandex_compute_instance.stage-agent1.network_interface.0.nat_ip_address}
    jenkins-agent-prod:
      ansible_host: ${yandex_compute_instance.prod-agent1.network_interface.0.nat_ip_address}
    grafana-master-01:
      ansible_host: ${yandex_compute_instance.grafana.network_interface.0.nat_ip_address}
    prometheus-master-01:
      ansible_host: ${yandex_compute_instance.grafana.network_interface.0.nat_ip_address}
    nginx-bl: ${yandex_compute_instance.nginx-bl.network_interface.0.nat_ip_address}
      ansible_host:
  children:
    jenkins:
      children:
        jenkins_masters:
          hosts:
            jenkins-master-01:
        jenkins_agent:
          hosts:
            jenkins-agent-stage:
            jenkins-agent-prod:
    grafana:
      children:
        grafana-master:
          hosts:
            grafana-master-01:
    prometheus:
      children:
        prometheus-master:
          hosts:
            prometheus-master-01:
  vars:
    ansible_connection_type: paramiko
    ansible_user: ${var.user}
    DOC
  filename = "../inventory/project.yml"
}

resource "local_file" "k8s-stage" {
  content = <<-DOC
--- 
# ## Configure 'ip' variable to bind kubernetes services on a
# ## different ip than the default iface
# ## We should set etcd_member_name for etcd cluster. The node that is not a etcd member do not need to set the value, or can set the empty string value.
[all]
stage-cp1 ansible_host=${yandex_compute_instance.stage-node1.network_interface.0.ip_address} etcd_member_name=etcd1 ansible_user=cloud-user
stage-node1 ansible_host=${yandex_compute_instance.stage-node2.network_interface.0.ip_address} ansible_user=cloud-user
stage-node2 ansible_host=${yandex_compute_instance.stage-node3.network_interface.0.ip_address} ansible_user=cloud-user

# ## configure a bastion host if your nodes are not directly reachable
# [bastion]
# bastion ansible_host=x.x.x.x ansible_user=some_user

[kube_control_plane]
stage-cp1

[etcd]
stage-cp1

[kube_node]
stage-node1
stage-node2

[calico_rr]

[k8s_cluster:children]
kube_control_plane
kube_node
calico_rr
    DOC
  filename = "../inventory/k8s-stage.ini"
}

resource "local_file" "k8s-prod" {
  content = <<-DOC
--- 
# ## Configure 'ip' variable to bind kubernetes services on a
# ## different ip than the default iface
# ## We should set etcd_member_name for etcd cluster. The node that is not a etcd member do not need to set the value, or can set the empty string value.
[all]
cp1 ansible_host=${yandex_compute_instance.prod-node1.network_interface.0.ip_address} etcd_member_name=etcd1 ansible_user=cloud-user
node1 ansible_host=${yandex_compute_instance.prod-node2.network_interface.0.ip_address} ansible_user=cloud-user
node2 ansible_host=${yandex_compute_instance.prod-node3.network_interface.0.ip_address} ansible_user=cloud-user

# ## configure a bastion host if your nodes are not directly reachable
# [bastion]
# bastion ansible_host=x.x.x.x ansible_user=some_user

[kube_control_plane]
cp1

[etcd]
cp1

[kube_node]
node1
node2


[calico_rr]

[k8s_cluster:children]
kube_control_plane
kube_node
calico_rr
    DOC
  filename = "../inventory/k8s-prod.ini"
}
