#output for vm load balancers names
output "load_balancers_names" {
  value = [for vm in vsphere_virtual_machine.load_balancers_vm : vm.name]
}

#output for vm load balancers ips
output "load_balancers_ips" {
  value = [for vm in vsphere_virtual_machine.load_balancers_vm : vm.default_ip_address]
}
#output for vms names
output "control_planes_names" {
  value = [for vm in vsphere_virtual_machine.control_planes : vm.name]
}

#output for vms ips
output "control_planes_ips" {
  value = [for vm in vsphere_virtual_machine.control_planes : vm.default_ip_address]
}

#output for worker vms names
output "worker_nodes_names" {
  value = [for vm in vsphere_virtual_machine.worker_nodes : vm.name]
}

#output for worker vms ips
output "worker_nodes_ips" {
  value = [for vm in vsphere_virtual_machine.worker_nodes : vm.default_ip_address]
}