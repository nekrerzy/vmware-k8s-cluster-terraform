
#output for vms names
output "control_planes_names" {
  value = [for vm in vsphere_virtual_machine.control_planes : vm.name]
}

#output for vms ips
output "control_planes_ips" {
  value = [for vm in vsphere_virtual_machine.control_planes : vm.default_ip_address]
}