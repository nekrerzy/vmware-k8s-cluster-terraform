# vmware-k8s-cluster-terraform
Deploy the vms for a basic HA kubernetes cluster using terraform, am existing ubuntu cloudimage template and a vcenter platform

Este código es un archivo de configuración de Terraform que describe la creación de máquinas virtuales en un entorno de vSphere para la creacion de un cluster de kubernetes.

Hay tres recursos definidos en este archivo, cada uno para crear un tipo diferente de máquina virtual:

El recurso "vsphere_virtual_machine" "load_balancers_vm" es utilizado para crear máquinas virtuales que funcionarán como balanceadores de carga.
El recurso "vsphere_virtual_machine" "control_planes" es utilizado para crear máquinas virtuales que funcionarán como nodos de control.
El recurso "vsphere_virtual_machine" "worker_nodes" es utilizado para crear máquinas virtuales que funcionarán como nodos de trabajo.

Cada recurso utiliza un bucle "for_each" que itera sobre una variable definida en el archivo de configuración llamada "var" seguida del nombre de la variable correspondiente para ese recurso específico.

Los atributos que se establecen para cada recurso incluyen:

"name": El nombre de la máquina virtual. En este caso, se establece el nombre de acuerdo con el valor de la clave "host_name" del mapa de cada valor de la variable iterada.
"resource_pool_id": El ID del recurso de agrupación de recursos (resource pool) en el que se creará la máquina virtual.
"datastore_id": El ID del almacenamiento de datos en el que se almacenarán los archivos de la máquina virtual.
"num_cpus": El número de CPU asignado a la máquina virtual.
"memory": La cantidad de memoria asignada a la máquina virtual.
"guest_id": El identificador del sistema operativo invitado de la máquina virtual. En este caso, se utiliza el valor del atributo "guest_id" del recurso "data.vsphere_virtual_machine.template".
"scsi_type": El tipo de controlador SCSI utilizado por la máquina virtual. En este caso, se utiliza el valor del atributo "scsi_type" del recurso "data.vsphere_virtual_machine.template".
"network_interface": Define la configuración de la interfaz de red de la máquina virtual.
"cdrom": Define la configuración del dispositivo CD-ROM de la máquina virtual.(necesario para la utilizacion de vapp)
"disk": Define la configuración del disco de la máquina virtual.
"vapp": Define la configuración de la aplicación de vSphere de la máquina virtual.
"clone": Define la configuración del clonado de la máquina virtual a partir de una plantilla existente.
Cada recurso "clone" define una sección "customize" que establece opciones de personalización para la máquina virtual recién creada, como la dirección IP, el nombre de host y las opciones de red. También se define el atributo "template_uuid" que contiene el ID de la plantilla que se utiliza como base para el clonado.

Además, algunos de los valores utilizados para establecer los atributos se definen en recursos externos, como "data.vsphere_resource_pool.pool" y "data.vsphere_datastore.datastore", que proporcionan información sobre el entorno de vSphere.

