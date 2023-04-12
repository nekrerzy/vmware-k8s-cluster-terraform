vsphere_server   = "192.168.101.130"
vsphere_user     = "Administrator@vsphere.local"
vsphere_password = "Engiedse-0"

datacenter_name = "NEJAPA"
datastore_name  = "datastore1"

cluster_name       = "DATACENTER"
resoruce_pool_name = "K8s-test"

networ_name = "SAP AISLADO"

vm_template_name = "ubuntu-22.04-cloudimg"

vms_ip_gateway      = "192.168.103.1"
vms_dns_server_list = ["192.168.101.10", "192.168.111.110"]

vms_domain_name = "lactolac.intranet"

vms_default_password = "lactolac"

vms_ssh_public_keys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOfoWfgMIlLN8+kWQAZQ7c+FleI5SdEk0MuzZXDXmaFU fher.navarro@gmail.com"


load_balancer_vms = {
  "loadbalancer1" = {
    host_name = "load-balancer1"
    ip        = "192.168.103.111"
  },
  "loadbalancer2" = {
    host_name = "load-balancer2"
    ip        = "192.168.103.112"
} }

control_plane_vms = {
  "control-plane1" = {
    host_name = "control-plane1"
    ip        = "192.168.103.131"
  },
  "control-plane2" = {
    host_name = "control-plane2"
    ip        = "192.168.103.132"
  },
  "control-plane3" = {
    host_name = "control-plane3"
    ip        = "192.168.103.133"
  }
}


worker_node_vms = {
  "worker-node-1" = {
    host_name = "worker-node-1"
    ip        = "192.168.103.121"
  },
  "worker-node-2" = {
    host_name = "worker-node-2"
    ip        = "192.168.103.122"
  },
  "worker-node-3" = {
    host_name = "worker-node-3"
    ip        = "192.168.103.123"
  }
}