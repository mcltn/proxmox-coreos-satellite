data "local_file" "controlplane_ignition" {
  filename = "${var.controlplane_ignition_file}"
}

resource "proxmox_virtual_environment_vm" "controlplane_vm1" {
  node_name   = "${var.controlplane_host}"
  name        = "controlplane1"
  description = "Control Plane node"
  machine     = "q35"
  cpu {
    cores = 6
    type = "host"
  }
  memory {
    dedicated = 24576
  }
  operating_system {
    type = "l26"
  }
  disk {
    interface    = "virtio0"
    datastore_id = "big"
    file_id      = proxmox_virtual_environment_file.coreos_qcow_2.id
    size         = 100
  }
  network_device {
    bridge = "vmbr0"
  }
  kvm_arguments = "-fw_cfg 'name=opt/com.coreos/config,string=${replace(replace(data.local_file.controlplane_ignition.content, ",", ",,"),"$$HOSTNAME$$","controlplane1")}'"
}
resource "proxmox_virtual_environment_vm" "controlplane_vm2" {
  node_name   = "${var.controlplane_host}"
  name        = "controlplane2"
  description = "Control Plane node"
  machine     = "q35"
  cpu {
    cores = 6
    type = "host"
  }
  memory {
    dedicated = 24576
  }
  operating_system {
    type = "l26"
  }
  disk {
    interface    = "virtio0"
    datastore_id = "big"
    file_id      = proxmox_virtual_environment_file.coreos_qcow_2.id
    size         = 100
  }
  network_device {
    bridge = "vmbr0"
  }
  kvm_arguments = "-fw_cfg 'name=opt/com.coreos/config,string=${replace(replace(data.local_file.controlplane_ignition.content, ",", ",,"),"$$HOSTNAME$$","controlplane2")}'"
}
resource "proxmox_virtual_environment_vm" "controlplane_vm3" {
  node_name   = "${var.controlplane_host}"
  name        = "controlplane3"
  description = "Control Plane node"
  machine     = "q35"
  cpu {
    cores = 6
    type = "host"
  }
  memory {
    dedicated = 24576
  }
  operating_system {
    type = "l26"
  }
  disk {
    interface    = "virtio0"
    datastore_id = "big"
    file_id      = proxmox_virtual_environment_file.coreos_qcow_2.id
    size         = 100
  }
  network_device {
    bridge = "vmbr0"
  }
  kvm_arguments = "-fw_cfg 'name=opt/com.coreos/config,string=${replace(replace(data.local_file.controlplane_ignition.content, ",", ",,"),"$$HOSTNAME$$","controlplane3")}'"
}
resource "proxmox_virtual_environment_vm" "worker_vm1" {
  node_name   = "${var.worker_host}"
  name        = "worker1"
  description = "Worker node"
  machine     = "q35"
  cpu {
    cores = 16
    type = "host"
  }
  memory {
    dedicated = 65536
  }
  operating_system {
    type = "l26"
  }
  disk {
    interface    = "virtio0"
    datastore_id = "big"
    file_id      = proxmox_virtual_environment_file.coreos_qcow_1.id
    size         = 200
  }
  network_device {
    bridge = "vmbr0"
  }
  kvm_arguments = "-fw_cfg 'name=opt/com.coreos/config,string=${replace(replace(data.local_file.controlplane_ignition.content, ",", ",,"),"$$HOSTNAME$$","worker1")}'"
}