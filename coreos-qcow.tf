resource "proxmox_virtual_environment_file" "coreos_qcow_1" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "prxmx1"
  source_file {
    path = "iso/${var.coreos_filename}"
    file_name = "${var.coreos_filename}"
    #insecure = true
  }
}

resource "proxmox_virtual_environment_file" "coreos_qcow_2" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "prxmx2"
  source_file {
    path = "iso/${var.coreos_filename}"
    file_name = "${var.coreos_filename}"
    #insecure = true
  }
}