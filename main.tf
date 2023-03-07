# Create the VM
resource "proxmox_vm_qemu" "this" {

  count = var.number
  #Name of the virtual machine
  name = "${var.name}-${count.index}"
  #Proxmox node used for the build
  target_node = var.pve_node

  # Clone from cloudinit template
  clone = var.template_cloudinit
  os_type = "cloud-init"
  qemu_os = "other"

  # Cloud init options
  ciuser  = var.ciuser
  cicustom = var.cicustom
  ipconfig0 = var.ipconfig0
  sshkeys = file(var.public_sshkeys)

  #Hardware configuration
  memory       = var.memory
  vcpus        = var.vcpus
  cores         = var.cores
  agent        = 1


  # Set the boot disk paramters
  bootdisk = "scsi0"
  scsihw       = "virtio-scsi-pci"

  #OS Disk
  disk {
    size            = var.os_disk_size
    type            = var.os_disk_type
    storage         = var.os_disk_storage
    iothread        = 0
  }

  #Data disks
  dynamic "disk" {
    for_each = var.data_disks
    content {
      size            = disk.value.size
      type            = disk.value.type
      storage         = disk.value.storage
      iothread        = 0
    }
  }

  #Network cards
  dynamic "network" {
    for_each = var.nics
    content {
      model = network.value.model
      bridge = network.value.bridge
    }
  }

  # Ignore changes to the network
  ## MAC address is generated on every apply, causing
  ## TF to think this needs to be rebuilt on every apply
  lifecycle {
     ignore_changes = [
       network
     ]
  }
}