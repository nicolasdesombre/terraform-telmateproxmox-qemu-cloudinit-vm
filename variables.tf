variable "number" {
  description = "Number of virtual machine builded."
  type        = number
  default     = 1
}

variable "name" {
  description = "(Required) Name of the virtual machine"
  type        = string
}

variable "pve_node" {
  description = "(Required) Name of the PVE node where the virtual machine will be deployed."
  type        = string
}

variable "template_cloudinit" {
  description = "(Required) Name of the Cloud-Init template which we be used."
  type        = string
}

variable "ciuser" {
  description = "Name of the first system administrator account which will be created by Cloud-Init."
  type        = string
  default     = "sysadmin"
}

variable "cicustom" {
  description = "Custom cloud-init file. (eg. `user=local:snippets/ubuntu2204-basic-cloudinit.yml`)"
  type        = string
  default     = null
}

variable "ipconfig0" {
    description = "IP Configuration (eg. `ip=dhcp` or `ip=10.0.0.1/24,gw=10.0.0.254`)."
    type        = string
    default     = "ip=dhcp"
}

variable "public_sshkeys" {
    description = "Public Ssh keys file path, which will be allowed to connect on the created system administrator account."
    type        = string
    default     = "~/.ssh/id_rsa.pub"
}

variable "memory" {
    description = "Memory allocated to the virtual machine."
    type        = number
    default     = 1024
}

variable "vcpus" {
    description = "Virtual CPU (socket) allocated to the virtual machine."
    type        = number
    default     = 1
}

variable "cores" {
    description = "CPU Core (per socket) allocated to the virtual machine."
    type        = number
    default     = 1
}

variable "os_disk_size" {
    description = "OS Disk size."
    type        = string
    default     = "16G"
}

variable "os_disk_type" {
    description = "OS Disk type"
    type        = string
    default     = "virtio"
}

variable "os_disk_storage" {
    description = "OS Disk storage location."
    type        = string
    default     = "local"
}

variable "data_disks" {
  description = "Data disks list."
  type = list(object({
    size            = string
    type            = string
    storage         = string
  }))
  default = []
}

variable "nics" {
  description = "Network cards list."
  type = list(object({
    model           = string
    bridge          = string
  }))
  default = [
    {
      model = "virtio"
      bridge = "vmbr1"
    }
  ]
}
