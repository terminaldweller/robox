packer {
  required_plugins {
    qemu = {
      source  = "github.com/hashicorp/qemu"
      version = "~> 1"
    }
    vagrant = {
      source  = "github.com/hashicorp/vagrant"
      version = "~> 1"
    }
  }
}

variable "box_version" {
  type    = string
  default = "${env("VERSION")}"
}

source "qemu" "generic-openbsd7-libvirt-x64" {
  boot_command           = ["S<enter><wait5>", "ifconfig vio0 group dhcp<enter><wait5>", "ifconfig vio0 inet autoconf<enter><wait10>", "ftp -o /install.conf http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.openbsd7.install.cfg<enter><wait5>", "ftp -o /install-chroot.sh http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.openbsd7.install.chroot.sh<enter><wait5>", "/install -a -f /install.conf -m install && chroot /mnt < /install-chroot.sh && reboot<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "60s"
  cpus                   = 2
  disk_cache             = "unsafe"
  disk_compression       = true
  disk_detect_zeroes     = "on"
  disk_discard           = "unmap"
  disk_image             = false
  disk_interface         = "virtio-scsi"
  disk_size              = "131072"
  format                 = "qcow2"
  headless               = true
  http_directory         = "http"
  iso_checksum           = "sha256:368018b06d18b79b07865a26f541eca21bbc9ee6934c5bf32c9960bce0928faf"
  iso_url                = "https://ftp.nluug.nl/OpenBSD/7.6/amd64/cd76.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-openbsd7-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "shutdown -h -p now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-openbsd7-libvirt-x64"
}

build {
  sources = ["source.qemu.generic-openbsd7-libvirt-x64"]

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/sh {{ .Path }}"
    expect_disconnect   = "true"
    only                = ["generic-openbsd7-libvirt-x64"]
    scripts             = ["scripts/openbsd7/pkg.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /usr/local/bin/bash {{ .Path }}"
    expect_disconnect   = "true"
    only                = ["generic-openbsd7-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/openbsd7/hostname.sh", "scripts/openbsd7/motd.sh", "scripts/openbsd7/vagrant.sh", "scripts/openbsd7/profile.sh", "scripts/openbsd7/virtualbox.sh", "scripts/openbsd7/parallels.sh", "scripts/openbsd7/vmware.sh", "scripts/openbsd7/qemu.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }
}
