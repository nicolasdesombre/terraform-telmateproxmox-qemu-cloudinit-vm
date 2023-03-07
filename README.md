# terraform-telmateproxmox-qemu-cloudinit-vm
## Introduction
A simple Terraform module, which make able to create one or more QEMU virtual machines on Proxmox, from a cloud-init template.
## Usage
Use environment variables to authenticate on you proxmox cluster (https://registry.terraform.io/providers/Telmate/proxmox/latest/docs) :
```shell
export PM_API_URL = "https://pve-cluster.your-domain.com:8006/api2/json"
export PM_USER="terraform-service-account@PVE"
export PM_PASS="YourSecretPassword!"
```
Then, enjoy !
```hcl
module "vm-test" {
    source = "git::https://github.com/nicolasdesombre/terraform-telmateproxmox-qemu-cloudinit-vm.git"

    name = "vm-test"
    pve_node = "pve"
    template_cloudinit = "ubuntu2204-cloudinit"
}

```
## Description
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 2.9.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 2.9.13 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [proxmox_vm_qemu.this](https://registry.terraform.io/providers/Telmate/proxmox/2.9.13/docs/resources/vm_qemu) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cicustom"></a> [cicustom](#input\_cicustom) | Custom cloud-init file. (eg. `user=local:snippets/ubuntu2204-basic-cloudinit.yml`) | `string` | `null` | no |
| <a name="input_ciuser"></a> [ciuser](#input\_ciuser) | Name of the first system administrator account which will be created by Cloud-Init. | `string` | `"sysadmin"` | no |
| <a name="input_cores"></a> [cores](#input\_cores) | CPU Core (per socket) allocated to the virtual machine. | `number` | `1` | no |
| <a name="input_data_disks"></a> [data\_disks](#input\_data\_disks) | Data disks list. | <pre>list(object({<br>    size            = string<br>    type            = string<br>    storage         = string<br>  }))</pre> | `[]` | no |
| <a name="input_ipconfig0"></a> [ipconfig0](#input\_ipconfig0) | IP Configuration (eg. `ip=dhcp` or `ip=10.0.0.1/24,gw=10.0.0.254`). | `string` | `"ip=dhcp"` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | Memory allocated to the virtual machine. | `number` | `1024` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Name of the virtual machine | `string` | n/a | yes |
| <a name="input_nics"></a> [nics](#input\_nics) | Network cards list. | <pre>list(object({<br>    model           = string<br>    bridge          = string<br>  }))</pre> | <pre>[<br>  {<br>    "bridge": "vmbr1",<br>    "model": "virtio"<br>  }<br>]</pre> | no |
| <a name="input_number"></a> [number](#input\_number) | Number of virtual machine builded. | `number` | `1` | no |
| <a name="input_os_disk_size"></a> [os\_disk\_size](#input\_os\_disk\_size) | OS Disk size. | `string` | `"16G"` | no |
| <a name="input_os_disk_storage"></a> [os\_disk\_storage](#input\_os\_disk\_storage) | OS Disk storage location. | `string` | `"local"` | no |
| <a name="input_os_disk_type"></a> [os\_disk\_type](#input\_os\_disk\_type) | OS Disk type | `string` | `"virtio"` | no |
| <a name="input_public_sshkeys"></a> [public\_sshkeys](#input\_public\_sshkeys) | Public Ssh keys file path, which will be allowed to connect on the created system administrator account. | `string` | `"~/.ssh/id_rsa.pub"` | no |
| <a name="input_pve_node"></a> [pve\_node](#input\_pve\_node) | (Required) Name of the PVE node where the virtual machine will be deployed. | `string` | n/a | yes |
| <a name="input_template_cloudinit"></a> [template\_cloudinit](#input\_template\_cloudinit) | (Required) Name of the Cloud-Init template which we be used. | `string` | n/a | yes |
| <a name="input_vcpus"></a> [vcpus](#input\_vcpus) | Virtual CPU (socket) allocated to the virtual machine. | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ipv4_address"></a> [ipv4\_address](#output\_ipv4\_address) | n/a |
<!-- END_TF_DOCS -->