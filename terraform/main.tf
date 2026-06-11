import {
  to = proxmox_virtual_environment_vm.ubuntu-cloud
  id = "pve/1000"
}

resource "proxmox_virtual_environment_vm" "ubuntu-cloud" {
  vm_id = 1000
  node_name = "pve"
  name = "ubuntu-cloud"
  started = false
  on_boot = false
  template = true

  cpu {
    affinity     = null
    architecture = null
    cores        = 2
    flags        = []
    hotplugged   = 0
    limit        = 0
    numa         = true
    sockets      = 1
    type         = "host"
    units        = null
  }

  memory {
    dedicated      = 4096
    floating       = 0
    hugepages      = null
    keep_hugepages = false
    shared         = 0
  }

  operating_system {
    type = "other"
  }

  serial_device {
    device = "socket"
  }

  vga {
    clipboard = null
    memory    = 16
    type      = "serial0"
  }

  initialization {
    datastore_id         = "local"
    file_format          = "qcow2"
    interface            = "ide2"
    meta_data_file_id    = null
    network_data_file_id = null
    type                 = null
    upgrade              = true
    user_data_file_id    = null
    vendor_data_file_id  = null
    ip_config {
      ipv4 {
        address = "dhcp"
        gateway = null
      } 
      ipv6 {
        address = "dhcp"
        gateway = null
      }
    }

    user_account {
      keys     = [var.pve_ssh_public_key, var.homelab_ssh_public_key]
      password = var.cloud_init_password
      username = "ubuntu"
    }
  }
}