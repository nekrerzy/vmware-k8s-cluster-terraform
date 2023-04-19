resource "vsphere_virtual_machine" "load_balancers_vm" {
  for_each         = var.load_balancer_vms
  name             = each.value.host_name
  folder           = data.vsphere_folder.folder.path
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = 1
  memory           = 1536
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  cdrom {
    client_device = true
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  vapp {
    properties = {
      "hostname"    = each.value.host_name,
      "password"    = var.vms_default_password,
      "instance-id" = each.value.host_name,
      "public-keys" = var.vms_ssh_public_keys
    }
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {

      linux_options {
        host_name = each.value.host_name
        domain    = var.vms_domain_name
      }
      network_interface {
        ipv4_address = each.value.ip
        ipv4_netmask = 24
      }
      ipv4_gateway    = var.vms_ip_gateway
      dns_server_list = var.vms_dns_server_list
    }
  }
}


resource "vsphere_virtual_machine" "control_planes" {
  for_each         = var.control_plane_vms
  name             = each.value.host_name
  folder           = data.vsphere_folder.folder.path
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = 2
  memory           = 2048
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  cdrom {
    client_device = true
  }
  disk {
    label            = "disk0"
    size             = 25
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  vapp {
    properties = {
      "hostname"    = each.value.host_name,
      "password"    = var.vms_default_password,
      "instance-id" = each.value.host_name,
      "public-keys" = var.vms_ssh_public_keys
    }
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {

      linux_options {
        host_name = each.value.host_name
        domain    = var.vms_domain_name
      }
      network_interface {
        ipv4_address = each.value.ip
        ipv4_netmask = 24
      }
      ipv4_gateway    = var.vms_ip_gateway
      dns_server_list = var.vms_dns_server_list
    }
  }
}


resource "vsphere_virtual_machine" "worker_nodes" {
  for_each         = var.worker_node_vms
  name             = each.value.host_name
  folder           = data.vsphere_folder.folder.path
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = 4
  memory           = 4096
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  cdrom {
    client_device = true
  }
  disk {
    label            = "disk0"
    size             = 50
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  vapp {
    properties = {
      "hostname"    = each.value.host_name,
      "password"    = var.vms_default_password,
      "instance-id" = each.value.host_name,
      "public-keys" = var.vms_ssh_public_keys
    }
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {

      linux_options {
        host_name = each.value.host_name
        domain    = var.vms_domain_name
      }
      network_interface {
        ipv4_address = each.value.ip
        ipv4_netmask = 24
      }
      ipv4_gateway    = var.vms_ip_gateway
      dns_server_list = var.vms_dns_server_list
    }
  }
}

