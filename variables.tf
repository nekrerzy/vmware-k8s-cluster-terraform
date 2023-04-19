
variable "datacenter_name" {
  description = "value for datacenter_name"
  type        = string
}

variable "datastore_name" {
  description = "value for datastore_name"
  type        = string
}

variable "cluster_name" {
  description = "value for cluster_name"
  type        = string
}

variable "resoruce_pool_name" {
  description = "value for resoruce_pool_name"
  type        = string
}

variable "folder_name" {
  description = "value for folder_name"
  type        = string
}

variable "networ_name" {
  description = "value for networ_name"
  type        = string

}

variable "vm_template_name" {
  description = "value for vm_template_name"
  type        = string
}

variable "vsphere_user" {
  description = "value for vsphere_user"
  type        = string

}

variable "vsphere_password" {
  description = "value for vsphere_password"
  type        = string


}

variable "vsphere_server" {
  description = "value for vsphere_server"
  type        = string

}

variable "vms_default_password" {
  description = "default password for vms"
  type        = string
}

variable "vms_ssh_public_keys" {
  description = "value for vms_ssh_public_keys"
  type        = string
}

variable "vms_domain_name" {
  description = "value for vms_domain_name"
  type        = string
}

variable "vms_ip_gateway" {
  description = "value for vms_ip_gateway"
  type        = string
}

variable "vms_dns_server_list" {
  description = "value for vms_dns_server_list"
  type        = list(string)
}

variable "load_balancer_vms" {
  type = map(object({
    host_name = string
    ip        = string
  }))
}

variable "control_plane_vms" {
  type = map(object({
    host_name = string
    ip        = string
  }))
}

variable "worker_node_vms" {
  type = map(object({
    host_name = string
    ip        = string
  }))
}