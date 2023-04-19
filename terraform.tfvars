vsphere_server   = ""
vsphere_user     = ""
vsphere_password = ""

datacenter_name = ""
datastore_name  = ""

cluster_name       = ""
resoruce_pool_name = ""
folder_name = ""

networ_name = ""

vm_template_name = ""

vms_ip_gateway      = ""
vms_dns_server_list = [""]

vms_domain_name = ""

vms_default_password = ""

vms_ssh_public_keys = ""


load_balancer_vms = {
  "loadbalancer1" = {
    host_name = ""
    ip        = ""
  },
  "loadbalancer2" = {
    host_name = ""
    ip        = ""
} }

control_plane_vms = {
  "control-plane1" = {
    host_name = ""
    ip        = ""
  },
  "control-plane2" = {
    host_name = ""
    ip        = ""
  },
  "control-plane3" = {
    host_name = ""
    ip        = ""
  }
}


worker_node_vms = {
  "worker-node-1" = {
    host_name = ""
    ip        = ""
  },
  "worker-node-2" = {
    host_name = ""
    ip        = ""
  },
  "worker-node-3" = {
    host_name = ""
    ip        = ""
  }
}