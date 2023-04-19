
#La sección "terraform" especifica la versión de Terraform y los proveedores requeridos para el archivo.
#En este caso, se requiere el proveedor de vSphere en la versión 2.3.1.

terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.3.1"
    }
  }
}

#La sección "provider" especifica los detalles de configuración del proveedor de vSphere,
#incluyendo la información de autenticación y la dirección del servidor vSphere.

provider "vsphere" {
  # Configuration options
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

#Las secciones "data" se utilizan para recuperar información de recursos existentes en vSphere. En este archivo, hay cinco secciones de datos distintas:

#vsphere_datacenter": Esta sección recupera el objeto del centro de datos vSphere que se especifica en la variable "datacenter_name".

data "vsphere_datacenter" "datacenter" {
  name = var.datacenter_name
}

#vsphere_datastore": Esta sección recupera el objeto del almacenamiento de datos vSphere que se especifica en la variable "datastore_name".
#El ID del centro de datos se toma de la sección "vsphere_datacenter".

data "vsphere_datastore" "datastore" {
  name          = var.datastore_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

#vsphere_compute_cluster": Esta sección recupera el objeto del clúster de cómputo vSphere que se especifica en la variable "cluster_name".
#El ID del centro de datos se toma de la sección "vsphere_datacenter".

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}


#vsphere_resource_pool": Esta sección recupera el objeto del grupo de recursos vSphere que se especifica en la variable "resource_pool_name". 
#El ID del centro de datos se toma de la sección "vsphere_datacenter"

data "vsphere_resource_pool" "pool" {
  name          = var.resoruce_pool_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}


#data for folder in vsphere
data "vsphere_folder" "folder" {
  path          = var.folder_name
}

#"vsphere_network": Esta sección recupera el objeto de red vSphere que se especifica en la variable "network_name". 
#El ID del centro de datos se toma de la sección "vsphere_datacenter".
data "vsphere_network" "network" {
  name          = var.networ_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

#"vsphere_virtual_machine", se utiliza para recuperar el objeto de la máquina virtual de vSphere que se utilizará como plantilla para la creación de
#una nueva máquina virtual. El nombre de la plantilla se especifica en la variable "vm_template_name", y el ID del centro de datos se toma de la 
#sección "vsphere_datacenter".

data "vsphere_virtual_machine" "template" {
  name          = var.vm_template_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

