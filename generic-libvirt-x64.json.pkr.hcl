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

source "qemu" "generic-alma8-libvirt-x64" {
  boot_command           = ["<tab> text biosdevname=0 net.ifnames=0 ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.alma8.vagrant.ks<enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:ab861d80c8b68634f3c16d414a4141759a082548ad7b251d8924675fa09decab"
  iso_url                = "https://dfw.mirror.rackspace.com/almalinux/8.9/isos/x86_64/AlmaLinux-8.9-x86_64-boot.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-alma8-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-alma8-libvirt-x64"
}

source "qemu" "generic-alma9-libvirt-x64" {
  boot_command           = ["<tab> net.ifnames=0 inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.alma9.vagrant.x64.ks vga=792 <enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:af5377a1d16bbe599ea91a8761ad645f2f54687075802bdc0c0703ee610182e9"
  iso_url                = "https://dfw.mirror.rackspace.com/almalinux/9.3/isos/x86_64/AlmaLinux-9.3-x86_64-boot.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-alma9-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  qemuargs               = [["-cpu", "max"]]
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-alma9-libvirt-x64"
}

source "qemu" "generic-alpine310-libvirt-x64" {
  boot_command           = ["<enter><wait10>", "root<enter><wait>", "ifconfig eth0 up && udhcpc -i eth0<enter><wait>", "wget http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.alpine310.vagrant.cfg<enter><wait>", "sed -i -e \"/rc-service/d\" /sbin/setup-sshd<enter><wait>", "printf \"vagrant\\nvagrant\\ny\\n\" | setup-alpine -f /root/generic.alpine310.vagrant.cfg ; ", "mount /dev/sda2 /mnt && ", "sed -E -i '/#? ?PasswordAuthentication/d' /mnt/etc/ssh/sshd_config && ", "sed -E -i '/#? ?PermitRootLogin/d' /mnt/etc/ssh/sshd_config && ", "echo 'PasswordAuthentication yes' >> /mnt/etc/ssh/sshd_config && ", "echo 'PermitRootLogin yes' >> /mnt/etc/ssh/sshd_config && ", "chroot /mnt apk add openntpd && chroot /mnt rc-update add openntpd default && ", "umount /mnt/boot && umount /mnt ; reboot<enter>"]
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
  iso_checksum           = "sha256:f4e6973b61f37c445bafd99f3beecabc9a68a56b17014297b1505d35faae85fb"
  iso_url                = "https://mirrors.edge.kernel.org/alpine/v3.10/releases/x86_64/alpine-virt-3.10.9-x86_64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-alpine310-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "/sbin/poweroff"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-alpine310-libvirt-x64"
}

source "qemu" "generic-alpine311-libvirt-x64" {
  boot_command           = ["<enter><wait10>", "root<enter><wait>", "ifconfig eth0 up && udhcpc -i eth0<enter><wait>", "wget http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.alpine311.vagrant.cfg<enter><wait>", "sed -i -e \"/rc-service/d\" /sbin/setup-sshd<enter><wait>", "printf \"vagrant\\nvagrant\\ny\\n\" | setup-alpine -f /root/generic.alpine311.vagrant.cfg ; ", "mount /dev/sda2 /mnt && ", "sed -E -i '/#? ?PasswordAuthentication/d' /mnt/etc/ssh/sshd_config && ", "sed -E -i '/#? ?PermitRootLogin/d' /mnt/etc/ssh/sshd_config && ", "echo 'PasswordAuthentication yes' >> /mnt/etc/ssh/sshd_config && ", "echo 'PermitRootLogin yes' >> /mnt/etc/ssh/sshd_config && ", "chroot /mnt apk add openntpd && chroot /mnt rc-update add openntpd default && ", "umount /mnt/boot && umount /mnt ; reboot<enter>"]
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
  iso_checksum           = "sha256:7a7038e5b3646aaf151ee8375ddee42408379275d2c11b413931e4e1b597be7e"
  iso_url                = "https://mirrors.edge.kernel.org/alpine/v3.11/releases/x86_64/alpine-virt-3.11.13-x86_64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-alpine311-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "/sbin/poweroff"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-alpine311-libvirt-x64"
}

source "qemu" "generic-alpine312-libvirt-x64" {
  boot_command           = ["<enter><wait10>", "root<enter><wait>", "ifconfig eth0 up && udhcpc -i eth0<enter><wait>", "wget http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.alpine312.vagrant.cfg<enter><wait>", "sed -i -e \"/rc-service/d\" /sbin/setup-sshd<enter><wait>", "printf \"vagrant\\nvagrant\\ny\\n\" | setup-alpine -f /root/generic.alpine312.vagrant.cfg ; ", "mount /dev/sda2 /mnt && ", "sed -E -i '/#? ?PasswordAuthentication/d' /mnt/etc/ssh/sshd_config && ", "sed -E -i '/#? ?PermitRootLogin/d' /mnt/etc/ssh/sshd_config && ", "echo 'PasswordAuthentication yes' >> /mnt/etc/ssh/sshd_config && ", "echo 'PermitRootLogin yes' >> /mnt/etc/ssh/sshd_config && ", "chroot /mnt apk add openntpd && chroot /mnt rc-update add openntpd default && ", "umount /mnt/boot && umount /mnt ; reboot<enter>"]
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
  iso_checksum           = "sha256:f569f7a9d47c1310f4ec50155a479adf0e27c79239d981a33629b62fa4281b63"
  iso_url                = "https://mirrors.edge.kernel.org/alpine/v3.12/releases/x86_64/alpine-virt-3.12.12-x86_64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-alpine312-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "/sbin/poweroff"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-alpine312-libvirt-x64"
}

source "qemu" "generic-alpine313-libvirt-x64" {
  boot_command           = ["<enter><wait10>", "root<enter><wait>", "ifconfig eth0 up && udhcpc -i eth0<enter><wait>", "wget http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.alpine313.vagrant.cfg<enter><wait>", "sed -i -e \"/rc-service/d\" /sbin/setup-sshd<enter><wait>", "printf \"vagrant\\nvagrant\\ny\\n\" | setup-alpine -f /root/generic.alpine313.vagrant.cfg ; ", "mount /dev/sda2 /mnt && ", "sed -E -i '/#? ?PasswordAuthentication/d' /mnt/etc/ssh/sshd_config && ", "sed -E -i '/#? ?PermitRootLogin/d' /mnt/etc/ssh/sshd_config && ", "echo 'PasswordAuthentication yes' >> /mnt/etc/ssh/sshd_config && ", "echo 'PermitRootLogin yes' >> /mnt/etc/ssh/sshd_config && ", "chroot /mnt apk add openntpd && chroot /mnt rc-update add openntpd default && ", "umount /mnt/boot && umount /mnt ; reboot<enter>"]
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
  iso_checksum           = "sha256:a1d440fc78d9bc1796980fd37ed24e5b7b74149d21df3d34b0ec745fc8f25128"
  iso_url                = "https://mirrors.edge.kernel.org/alpine/v3.13/releases/x86_64/alpine-virt-3.13.12-x86_64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-alpine313-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "/sbin/poweroff"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-alpine313-libvirt-x64"
}

source "qemu" "generic-alpine314-libvirt-x64" {
  boot_command           = ["<enter><wait10>", "root<enter><wait>", "ifconfig eth0 up && udhcpc -i eth0<enter><wait>", "wget http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.alpine314.vagrant.cfg<enter><wait>", "sed -i -e \"/rc-service/d\" /sbin/setup-sshd<enter><wait>", "printf \"vagrant\\nvagrant\\ny\\n\" | setup-alpine -f /root/generic.alpine314.vagrant.cfg ; ", "mount /dev/sda2 /mnt && ", "sed -E -i '/#? ?PasswordAuthentication/d' /mnt/etc/ssh/sshd_config && ", "sed -E -i '/#? ?PermitRootLogin/d' /mnt/etc/ssh/sshd_config && ", "echo 'PasswordAuthentication yes' >> /mnt/etc/ssh/sshd_config && ", "echo 'PermitRootLogin yes' >> /mnt/etc/ssh/sshd_config && ", "chroot /mnt apk add openntpd && chroot /mnt rc-update add openntpd default && ", "umount /mnt/boot && umount /mnt ; reboot<enter>"]
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
  iso_checksum           = "sha256:5e0cd8432e256f75463f464de83ded2dde47d6fd40da77c1217b0f8103bbcf0d"
  iso_url                = "https://mirrors.edge.kernel.org/alpine/v3.14/releases/x86_64/alpine-virt-3.14.10-x86_64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-alpine314-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "/sbin/poweroff"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-alpine314-libvirt-x64"
}

source "qemu" "generic-alpine315-libvirt-x64" {
  boot_command           = ["<enter><wait10>", "root<enter><wait>", "ifconfig eth0 up && udhcpc -i eth0<enter><wait>", "wget http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.alpine315.vagrant.cfg<enter><wait>", "sed -i -e \"/rc-service/d\" /sbin/setup-sshd<enter><wait>", "source generic.alpine315.vagrant.cfg<enter><wait>", "printf \"vagrant\\nvagrant\\n\" | sh /sbin/setup-alpine -f /root/generic.alpine315.vagrant.cfg && ", "mount /dev/sda2 /mnt && ", "sed -E -i '/#? ?PasswordAuthentication/d' /mnt/etc/ssh/sshd_config && ", "sed -E -i '/#? ?PermitRootLogin/d' /mnt/etc/ssh/sshd_config && ", "echo 'PasswordAuthentication yes' >> /mnt/etc/ssh/sshd_config && ", "echo 'PermitRootLogin yes' >> /mnt/etc/ssh/sshd_config && ", "chroot /mnt apk add openntpd && chroot /mnt rc-update add openntpd default && reboot<enter>"]
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
  iso_checksum           = "sha256:9ca038e9aa243252be272a02d16ebda896aacfa1ee866cdc72efb6dc0a99b6b6"
  iso_url                = "https://mirrors.edge.kernel.org/alpine/v3.15/releases/x86_64/alpine-virt-3.15.11-x86_64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-alpine315-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "/sbin/poweroff"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-alpine315-libvirt-x64"
}

source "qemu" "generic-alpine316-libvirt-x64" {
  boot_command           = ["<enter><wait10>", "root<enter><wait>", "ifconfig eth0 up && udhcpc -i eth0<enter><wait>", "wget http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.alpine316.vagrant.cfg<enter><wait>", "sed -i -e \"/rc-service/d\" /sbin/setup-sshd<enter><wait>", "source generic.alpine316.vagrant.cfg<enter><wait>", "printf \"vagrant\\nvagrant\\n\" | sh /sbin/setup-alpine -f /root/generic.alpine316.vagrant.cfg && ", "mount /dev/sda2 /mnt && ", "sed -E -i '/#? ?PasswordAuthentication/d' /mnt/etc/ssh/sshd_config && ", "sed -E -i '/#? ?PermitRootLogin/d' /mnt/etc/ssh/sshd_config && ", "echo 'PasswordAuthentication yes' >> /mnt/etc/ssh/sshd_config && ", "echo 'PermitRootLogin yes' >> /mnt/etc/ssh/sshd_config && ", "chroot /mnt apk add openntpd && chroot /mnt rc-update add openntpd default && reboot<enter>"]
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
  iso_checksum           = "sha256:160c76f65ef888cb4cb4758a3b9d81d44f597ce22631aa94ae164c6a529d7b43"
  iso_url                = "https://mirrors.edge.kernel.org/alpine/v3.16/releases/x86_64/alpine-virt-3.16.8-x86_64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-alpine316-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "/sbin/poweroff"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-alpine316-libvirt-x64"
}

source "qemu" "generic-alpine317-libvirt-x64" {
  boot_command           = ["<enter><wait10>", "root<enter><wait>", "ifconfig eth0 up && udhcpc -i eth0<enter><wait>", "wget http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.alpine317.vagrant.cfg<enter><wait>", "sed -i -e \"/rc-service/d\" /sbin/setup-sshd<enter><wait>", "source generic.alpine317.vagrant.cfg<enter><wait>", "printf \"vagrant\\nvagrant\\n\" | sh /sbin/setup-alpine -f /root/generic.alpine317.vagrant.cfg && ", "mount /dev/sda2 /mnt && ", "sed -E -i '/#? ?PasswordAuthentication/d' /mnt/etc/ssh/sshd_config && ", "sed -E -i '/#? ?PermitRootLogin/d' /mnt/etc/ssh/sshd_config && ", "echo 'PasswordAuthentication yes' >> /mnt/etc/ssh/sshd_config && ", "echo 'PermitRootLogin yes' >> /mnt/etc/ssh/sshd_config && ", "chroot /mnt apk add openntpd && chroot /mnt rc-update add openntpd default && reboot<enter>"]
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
  iso_checksum           = "sha256:c7d38cd63d49efa7fa3ca4899ee52abe8c069b6bac43adf7164404bead1b09d3"
  iso_url                = "https://mirrors.edge.kernel.org/alpine/v3.17/releases/x86_64/alpine-virt-3.17.6-x86_64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-alpine317-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "/sbin/poweroff"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-alpine317-libvirt-x64"
}

source "qemu" "generic-alpine318-libvirt-x64" {
  boot_command           = ["<enter><wait10>", "root<enter><wait>", "ifconfig eth0 up && udhcpc -i eth0<enter><wait>", "wget http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.alpine318.vagrant.cfg<enter><wait>", "sed -i -e \"/rc-service/d\" /sbin/setup-sshd<enter><wait>", "source generic.alpine318.vagrant.cfg<enter><wait>", "printf \"vagrant\\nvagrant\\n\" | sh /sbin/setup-alpine -f /root/generic.alpine318.vagrant.cfg && ", "mount /dev/sda2 /mnt && ", "sed -E -i '/#? ?PasswordAuthentication/d' /mnt/etc/ssh/sshd_config && ", "sed -E -i '/#? ?PermitRootLogin/d' /mnt/etc/ssh/sshd_config && ", "echo 'PasswordAuthentication yes' >> /mnt/etc/ssh/sshd_config && ", "echo 'PermitRootLogin yes' >> /mnt/etc/ssh/sshd_config && ", "chroot /mnt apk add openntpd && chroot /mnt rc-update add openntpd default && reboot<enter>"]
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
  iso_checksum           = "sha256:7b9df963b46872b195daf527085a8fea76c0576d966a71fd18bcd4e1914f0eae"
  iso_url                = "https://mirrors.edge.kernel.org/alpine/v3.18/releases/x86_64/alpine-virt-3.18.5-x86_64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-alpine318-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "/sbin/poweroff"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-alpine318-libvirt-x64"
}

source "qemu" "generic-alpine319-libvirt-x64" {
  boot_command           = ["<enter><wait10>", "root<enter><wait>", "ifconfig eth0 up && udhcpc -i eth0<enter><wait>", "wget http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.alpine319.vagrant.cfg<enter><wait>", "sed -i -e \"/rc-service/d\" /sbin/setup-sshd<enter><wait>", "source generic.alpine319.vagrant.cfg<enter><wait>", "printf \"vagrant\\nvagrant\\n\" | sh /sbin/setup-alpine -f /root/generic.alpine319.vagrant.cfg && ", "mount /dev/sda2 /mnt && ", "sed -E -i '/#? ?PasswordAuthentication/d' /mnt/etc/ssh/sshd_config && ", "sed -E -i '/#? ?PermitRootLogin/d' /mnt/etc/ssh/sshd_config && ", "echo 'PasswordAuthentication yes' >> /mnt/etc/ssh/sshd_config && ", "echo 'PermitRootLogin yes' >> /mnt/etc/ssh/sshd_config && ", "chroot /mnt apk add openntpd && chroot /mnt rc-update add openntpd default && reboot<enter>"]
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
  iso_checksum           = "sha256:95ed37b1e54b04aad1c6ff54a5fd60d904363a2a8810c3e3dfe4c2a29e94056b"
  iso_url                = "https://mirrors.edge.kernel.org/alpine/v3.19/releases/x86_64/alpine-virt-3.19.0-x86_64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-alpine319-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "/sbin/poweroff"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-alpine319-libvirt-x64"
}

source "qemu" "generic-alpine35-libvirt-x64" {
  boot_command           = ["<enter><wait10>", "root<enter><wait>", "ifconfig eth0 up && udhcpc -i eth0<enter><wait>", "wget http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.alpine35.vagrant.cfg<enter><wait>", "sed -i -e \"/rc-service/d\" /sbin/setup-sshd<enter><wait>", "printf \"vagrant\\nvagrant\\ny\\n\" | setup-alpine -f generic.alpine35.vagrant.cfg ; ", "mount /dev/sda3 /mnt && ", "echo 'PasswordAuthentication yes' >> /mnt/etc/ssh/sshd_config && ", "echo 'PermitRootLogin yes' >> /mnt/etc/ssh/sshd_config && ", "umount /mnt/boot && umount /mnt ; reboot<enter>"]
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
  iso_checksum           = "sha256:580bc6379e4b246d24b5e32d2637319a60ac953279b3e0df523222ef561bf2f5"
  iso_url                = "https://mirrors.edge.kernel.org/alpine/v3.5/releases/x86_64/alpine-virt-3.5.3-x86_64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-alpine35-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "/sbin/poweroff"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-alpine35-libvirt-x64"
}

source "qemu" "generic-alpine36-libvirt-x64" {
  boot_command           = ["<enter><wait10>", "root<enter><wait>", "ifconfig eth0 up && udhcpc -i eth0<enter><wait>", "wget http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.alpine36.vagrant.cfg<enter><wait>", "sed -i -e \"/rc-service/d\" /sbin/setup-sshd<enter><wait>", "printf \"vagrant\\nvagrant\\ny\\n\" | setup-alpine -f generic.alpine36.vagrant.cfg ; ", "mount /dev/sda3 /mnt && ", "echo 'PasswordAuthentication yes' >> /mnt/etc/ssh/sshd_config && ", "echo 'PermitRootLogin yes' >> /mnt/etc/ssh/sshd_config && ", "umount /mnt/boot && umount /mnt ; reboot<enter>"]
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
  iso_checksum           = "sha256:b5936e27487e605ea3cbf040d444505ea7fd735021258d7b119faaa9b4b5b083"
  iso_url                = "https://mirrors.edge.kernel.org/alpine/v3.6/releases/x86_64/alpine-virt-3.6.5-x86_64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-alpine36-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "/sbin/poweroff"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-alpine36-libvirt-x64"
}

source "qemu" "generic-alpine37-libvirt-x64" {
  boot_command           = ["<enter><wait10>", "root<enter><wait>", "ifconfig eth0 up && udhcpc -i eth0<enter><wait>", "wget http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.alpine37.vagrant.cfg<enter><wait>", "sed -i -e \"/rc-service/d\" /sbin/setup-sshd<enter><wait>", "printf \"vagrant\\nvagrant\\ny\\n\" | setup-alpine -f /root/generic.alpine37.vagrant.cfg ; ", "mount /dev/sda3 /mnt && ", "echo 'PasswordAuthentication yes' >> /mnt/etc/ssh/sshd_config && ", "echo 'PermitRootLogin yes' >> /mnt/etc/ssh/sshd_config && ", "umount /mnt/boot && umount /mnt ; reboot<enter>"]
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
  iso_checksum           = "sha256:2f7a23fc31a6f67348e5614597b23ab8d9340e8a0f4368e96797b1a6c65fa6b8"
  iso_url                = "https://mirrors.edge.kernel.org/alpine/v3.7/releases/x86_64/alpine-virt-3.7.3-x86_64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-alpine37-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "/sbin/poweroff"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-alpine37-libvirt-x64"
}

source "qemu" "generic-alpine38-libvirt-x64" {
  boot_command           = ["<enter><wait10>", "root<enter><wait>", "ifconfig eth0 up && udhcpc -i eth0<enter><wait>", "wget http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.alpine38.vagrant.cfg<enter><wait>", "sed -i -e \"/rc-service/d\" /sbin/setup-sshd<enter><wait>", "printf \"vagrant\\nvagrant\\ny\\n\" | setup-alpine -f /root/generic.alpine38.vagrant.cfg ; ", "mount /dev/sda2 /mnt && ", "echo 'PasswordAuthentication yes' >> /mnt/etc/ssh/sshd_config && ", "echo 'PermitRootLogin yes' >> /mnt/etc/ssh/sshd_config && ", "umount /mnt/boot && umount /mnt ; reboot<enter>"]
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
  iso_checksum           = "sha256:9c1d8222c6af31f5e1e62dc25b5f4f922a27a6b3c7f8e136febd0c66dcdb51e3"
  iso_url                = "https://mirrors.edge.kernel.org/alpine/v3.8/releases/x86_64/alpine-virt-3.8.5-x86_64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-alpine38-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "/sbin/poweroff"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-alpine38-libvirt-x64"
}

source "qemu" "generic-alpine39-libvirt-x64" {
  boot_command           = ["<enter><wait10>", "root<enter><wait>", "ifconfig eth0 up && udhcpc -i eth0<enter><wait>", "wget http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.alpine39.vagrant.cfg<enter><wait>", "sed -i -e \"/rc-service/d\" /sbin/setup-sshd<enter><wait>", "printf \"vagrant\\nvagrant\\ny\\n\" | setup-alpine -f /root/generic.alpine39.vagrant.cfg ; ", "mount /dev/sda2 /mnt && ", "echo 'PasswordAuthentication yes' >> /mnt/etc/ssh/sshd_config && ", "echo 'PermitRootLogin yes' >> /mnt/etc/ssh/sshd_config && ", "chroot /mnt apk add openntpd && chroot /mnt rc-update add openntpd default && ", "umount /mnt/boot && umount /mnt ; reboot<enter>"]
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
  iso_checksum           = "sha256:888d2245ec900351d3613d831838d1459ac29635b56bd528cd50fd643200d4cf"
  iso_url                = "https://mirrors.edge.kernel.org/alpine/v3.9/releases/x86_64/alpine-virt-3.9.6-x86_64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-alpine39-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "/sbin/poweroff"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-alpine39-libvirt-x64"
}

source "qemu" "generic-arch-libvirt-x64" {
  boot_command           = ["<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<spacebar>net.ifnames=0 biosdevname=0 systemd.mask=sshd.service<enter>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "sed -i 's/[#]\\?DNSSEC=.*/DNSSEC=false/g' /etc/systemd/resolved.conf<enter><wait>", "systemctl restart systemd-resolved<enter><wait>", "systemctl restart dhcpcd<enter><wait>", "curl -O 'http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.arch.vagrant{,.chroot}.sh'<enter><wait>", "bash generic.arch.vagrant.sh < generic.arch.vagrant.chroot.sh && systemctl reboot<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "1s"
  cpus                   = 2
  disk_cache             = "unsafe"
  disk_compression       = true
  disk_detect_zeroes     = "on"
  disk_discard           = "unmap"
  disk_image             = false
  disk_interface         = "virtio"
  disk_size              = "131072"
  format                 = "qcow2"
  headless               = true
  http_directory         = "http"
  iso_checksum           = "sha256:12addd7d4154df1caf5f258b80ad72e7a724d33e75e6c2e6adc1475298d47155"
  iso_url                = "https://mirrors.kernel.org/archlinux/iso/latest/archlinux-2024.01.01-x86_64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-arch-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  qemuargs               = [["-device", "virtio-serial"], ["-device", "virtserialport,id=channel0,name=org.qemu.guest_agent.0"]]
  shutdown_command       = "systemctl poweroff"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-arch-libvirt-x64"
}

source "qemu" "generic-centos6-libvirt-x64" {
  boot_command           = ["<tab> text biosdevname=0 net.ifnames=0 ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.centos6.vagrant.ks<enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:7c0dee2a0494dabd84809b72ddb4b761f9ef92b78a506aef709b531c54d30770"
  iso_url                = "https://vault.centos.org/6.10/isos/x86_64/CentOS-6.10-x86_64-minimal.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-centos6-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-centos6-libvirt-x64"
}

source "qemu" "generic-centos7-libvirt-x64" {
  boot_command           = ["<tab> text biosdevname=0 net.ifnames=0 ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.centos7.vagrant.ks<enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:07b94e6b1a0b0260b94c83d6bb76b26bf7a310dc78d7a9c7432809fb9bc6194a"
  iso_url                = "https://mirrors.edge.kernel.org/centos/7.9.2009/isos/x86_64/CentOS-7-x86_64-Minimal-2009.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-centos7-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-centos7-libvirt-x64"
}

source "qemu" "generic-centos8-libvirt-x64" {
  boot_command           = ["<tab> text biosdevname=0 net.ifnames=0 ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.centos8.vagrant.ks<enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:9602c69c52d93f51295c0199af395ca0edbe35e36506e32b8e749ce6c8f5b60a"
  iso_url                = "https://vault.centos.org/8.5.2111/isos/x86_64/CentOS-8.5.2111-x86_64-boot.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-centos8-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-centos8-libvirt-x64"
}

source "qemu" "generic-centos8s-libvirt-x64" {
  boot_command           = ["<tab> text biosdevname=0 net.ifnames=0 ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.centos8s.vagrant.ks<enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:91580519c53b1f541ab44b22bbaadcfab7bff382fd629d71440aad49c985f9b9"
  iso_url                = "https://mirror.leaseweb.net/centos/8-stream/isos/x86_64/CentOS-Stream-8-20240117.0-x86_64-boot.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-centos8s-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-centos8s-libvirt-x64"
}

source "qemu" "generic-centos9s-libvirt-x64" {
  boot_command           = ["<tab> net.ifnames=0 inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.centos9s.vagrant.ks vga=792 <enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:d8ea5021ea3928b242d4c9bc036599ca831a868daebd5622f0ee9f84fe7d00af"
  iso_url                = "https://dfw.mirror.rackspace.com/centos-stream/9-stream/BaseOS/x86_64/iso/CentOS-Stream-9-20240115.0-x86_64-boot.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-centos9s-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  qemuargs               = [["-cpu", "max"]]
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-centos9s-libvirt-x64"
}

source "qemu" "generic-debian10-libvirt-x64" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "/install.amd/vmlinuz auto=true priority=critical vga=788 initrd=/install.amd/gtk/initrd.gz --- quiet ", "ipv6.disable_ipv6=1 net.ifnames=0 biosdevname=0 preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.debian10.vagrant.cfg ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "10s"
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
  iso_checksum           = "sha256:75aa64071060402a594dcf1e14afd669ca0f8bf757b56d4c9c1a31b8f7c8f931"
  iso_url                = "https://cdimage.debian.org/cdimage/archive/10.13.0/amd64/iso-cd/debian-10.13.0-amd64-netinst.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-debian10-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-debian10-libvirt-x64"
}

source "qemu" "generic-debian11-libvirt-x64" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "/install.amd/vmlinuz auto=true priority=critical vga=788 initrd=/install.amd/gtk/initrd.gz --- quiet ", "ipv6.disable_ipv6=1 net.ifnames=0 biosdevname=0 preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.debian11.vagrant.cfg ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "10s"
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
  iso_checksum           = "sha256:d7a74813a734083df30c8d35784926deaa36bc41e5c0766388e9f591ab056b72"
  iso_url                = "https://cdimage.debian.org/cdimage/archive/11.8.0/amd64/iso-cd/debian-11.8.0-amd64-netinst.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-debian11-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-debian11-libvirt-x64"
}

source "qemu" "generic-debian12-libvirt-x64" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "/install.amd/vmlinuz auto=true priority=critical vga=788 initrd=/install.amd/gtk/initrd.gz --- quiet ", "ipv6.disable_ipv6=1 net.ifnames=0 biosdevname=0 preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.debian12.vagrant.cfg ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "10s"
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
  iso_checksum           = "sha256:64d727dd5785ae5fcfd3ae8ffbede5f40cca96f1580aaa2820e8b99dae989d94"
  iso_url                = "https://cdimage.debian.org/cdimage/release/12.4.0/amd64/iso-cd/debian-12.4.0-amd64-netinst.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-debian12-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-debian12-libvirt-x64"
}

source "qemu" "generic-debian8-libvirt-x64" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "auto ", "ipv6.disable_ipv6=1 net.ifnames=0 biosdevname=0 preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.debian8.vagrant.cfg ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "10s"
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
  iso_checksum           = "sha256:a3bd67cd363b609e1340cea06a666cb476b63fc79abf4380c0475dd1b6dc8a31"
  iso_url                = "https://cdimage.debian.org/cdimage/archive/8.11.1/amd64/iso-dvd/debian-8.11.1-amd64-DVD-1.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-debian8-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-debian8-libvirt-x64"
}

source "qemu" "generic-debian9-libvirt-x64" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "auto ", "ipv6.disable_ipv6=1 net.ifnames=0 biosdevname=0 preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.debian9.vagrant.cfg ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "10s"
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
  iso_checksum           = "sha256:71c7e9eb292acc880f84605b1ca2b997f25737fe0a43fc9586f61d35cd2eb43b"
  iso_url                = "https://cdimage.debian.org/cdimage/archive/9.13.0/amd64/iso-cd/debian-9.13.0-amd64-netinst.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-debian9-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-debian9-libvirt-x64"
}

source "qemu" "generic-devuan1-libvirt-x64" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "auto ", "ipv6.disable_ipv6=1 net.ifnames=0 biosdevname=0 preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.devuan1.vagrant.cfg ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "10s"
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
  iso_checksum           = "sha256:70c6abe544ec59b0d0882c666ca0377be1b6c218655dac1f61b2c7e88c9b3d9f"
  iso_url                = "https://mirror.leaseweb.com/devuan/devuan_jessie/installer-iso/devuan_jessie_1.0.0_amd64_NETINST.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-devuan1-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P -h now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-devuan1-libvirt-x64"
}

source "qemu" "generic-devuan2-libvirt-x64" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "auto ", "ipv6.disable_ipv6=1 net.ifnames=0 biosdevname=0 preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.devuan2.vagrant.cfg ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "10s"
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
  iso_checksum           = "sha256:9aa6de460fb944ddfec8c79306974a522be166e4d296e9673f083f9e1cc6c56c"
  iso_url                = "https://mirror.leaseweb.com/devuan/devuan_ascii/installer-iso/devuan_ascii_2.1_amd64_netinst.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-devuan2-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P -h now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-devuan2-libvirt-x64"
}

source "qemu" "generic-devuan3-libvirt-x64" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "auto ", "ipv6.disable_ipv6=1 net.ifnames=0 biosdevname=0 preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.devuan3.vagrant.cfg ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "10s"
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
  iso_checksum           = "sha256:1723cbbeb1aee26a54e1370b688e7dc03921402348d2a60086c58c18cd9cf24b"
  iso_url                = "https://mirror.leaseweb.com/devuan/devuan_beowulf/installer-iso/devuan_beowulf_3.1.1_amd64_netinstall.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-devuan3-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P -h now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-devuan3-libvirt-x64"
}

source "qemu" "generic-devuan4-libvirt-x64" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "auto ", "ipv6.disable_ipv6=1 net.ifnames=0 biosdevname=0 preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.devuan4.vagrant.cfg ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "10s"
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
  iso_checksum           = "sha256:0923470af430e3d582a635956bbe4c13abc18fbaa4704e6deef3b362833e0ef5"
  iso_url                = "https://mirror.leaseweb.com/devuan/devuan_chimaera/installer-iso/devuan_chimaera_4.0.0_amd64_netinstall.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-devuan4-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P -h now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-devuan4-libvirt-x64"
}

source "qemu" "generic-devuan5-libvirt-x64" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "4<wait3><tab>", " ipv6.disable_ipv6=1 net.ifnames=0 biosdevname=0 preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.devuan5.vagrant.cfg ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "10s"
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
  iso_checksum           = "sha256:722af7905595d9a1417f48f783d43dd40fe7da7a2e1d7998a8ea47df2d26941b"
  iso_url                = "https://mirror.leaseweb.com/devuan/devuan_daedalus/installer-iso/devuan_daedalus_5.0.1_amd64_netinstall.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-devuan5-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P -h now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-devuan5-libvirt-x64"
}

source "qemu" "generic-dragonflybsd-libvirt-x64" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "boot -s<enter>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "root<enter><wait5>", "/bin/sh<enter><wait10>", "dhclient -l /tmp/dhclient.lease.vtnet0 vtnet0<enter><wait5>", "fetch -o /tmp/installerconfig http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.dragonflybsd.vagrant.cfg<enter><wait10>", "sh -c ' { sh -ex /tmp/installerconfig 2>&1 && reboot ; } | tee /tmp/installerconfig.log ' <enter><wait10>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "1s"
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
  iso_checksum           = "sha256:20e4724a3cb838fec0148a4adbffd9bd57b3e6d759a6599d1149188a19c61265"
  iso_url                = "https://mirror-master.dragonflybsd.org/iso-images/dfly-x86_64-6.4.0_REL.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-dragonflybsd-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "shutdown -p now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-dragonflybsd-libvirt-x64"
}

source "qemu" "generic-dragonflybsd5-libvirt-x64" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "boot -s<enter>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "root<enter><wait5>", "/bin/sh<enter><wait10>", "dhclient -l /tmp/dhclient.lease.vtnet0 vtnet0<enter><wait5>", "fetch -o /tmp/installerconfig http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.dragonflybsd5.vagrant.cfg<enter><wait10>", "sh -c ' { sh -ex /tmp/installerconfig 2>&1 && reboot ; } | tee /tmp/installerconfig.log ' <enter><wait10>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "1s"
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
  iso_checksum           = "sha256:8c169e787822ab743e0ee7ddb97c2f4181316ebcd7f7a3e82a085c30f3ea29b5"
  iso_url                = "https://mirrors.lavabit.com/dragonflybsd/dfly-x86_64-5.8.3_REL.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-dragonflybsd5-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "shutdown -p now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-dragonflybsd5-libvirt-x64"
}

source "qemu" "generic-dragonflybsd6-libvirt-x64" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "boot -s<enter>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "root<enter><wait5>", "/bin/sh<enter><wait10>", "dhclient -l /tmp/dhclient.lease.vtnet0 vtnet0<enter><wait5>", "fetch -o /tmp/installerconfig http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.dragonflybsd6.vagrant.cfg<enter><wait10>", "sh -c ' { sh -ex /tmp/installerconfig 2>&1 && reboot ; } | tee /tmp/installerconfig.log ' <enter><wait10>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "1s"
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
  iso_checksum           = "sha256:20e4724a3cb838fec0148a4adbffd9bd57b3e6d759a6599d1149188a19c61265"
  iso_url                = "https://mirror-master.dragonflybsd.org/iso-images/dfly-x86_64-6.4.0_REL.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-dragonflybsd6-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "shutdown -p now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-dragonflybsd6-libvirt-x64"
}

source "qemu" "generic-fedora-rawhide-libvirt-x64" {
  boot_command           = ["c<wait>", "insmod all_video<enter><wait>", "set gfxpayload=keep<enter><wait>", "insmod increment<enter><wait>", "insmod xfs<enter><wait>", "insmod diskfilter<enter><wait>", "insmod mdraid1x<enter><wait>", "insmod fat<enter><wait>", "insmod blscfg<enter><wait>", "insmod gzio<enter><wait>", "insmod part_gpt<enter><wait>", "insmod ext2<enter><wait>", "insmod chain<enter><wait>", "search --no-floppy --set=root -l 'Fedora-S-dvd-x86_64-39'<enter><wait>", "linux /images/pxeboot/vmlinuz inst.stage2=hd:LABEL=Fedora-S-dvd-x86_64-rawh rd.live.check ", "net.ifnames=0 inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.rawhide.vagrant.x64.ks<enter><wait>", "initrd /images/pxeboot/initrd.img<enter><wait10>", "boot<enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:0372074abc8b3e3c28dbf5599093ccaf12dfe8b0a4bfd3ffaf6ce2a72fb6052c"
  iso_url                = "https://mirrors.kernel.org/fedora/development/rawhide/Server/x86_64/iso/Fedora-Server-netinst-x86_64-Rawhide-20240117.n.0.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-fedora-rawhide-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-fedora-rawhide-libvirt-x64"
}

source "qemu" "generic-fedora25-libvirt-x64" {
  boot_command           = ["<tab> ", "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.fedora25.vagrant.ks ", "biosdevname=0 ", "net.ifnames=0 ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:86bc3694f4938382753d1e9536f2140a6c9c1978207766340c679a89509073c7"
  iso_url                = "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/25/Server/x86_64/iso/Fedora-Server-netinst-x86_64-25-1.3.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-fedora25-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-fedora25-libvirt-x64"
}

source "qemu" "generic-fedora26-libvirt-x64" {
  boot_command           = ["<tab> ", "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.fedora26.vagrant.ks ", "biosdevname=0 ", "net.ifnames=0 ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:e260921ef5c7bd5ee2a7b2f2f1156af6483014c73984e4cf37f2b6690e0155e5"
  iso_url                = "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/26/Server/x86_64/iso/Fedora-Server-netinst-x86_64-26-1.5.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-fedora26-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-fedora26-libvirt-x64"
}

source "qemu" "generic-fedora27-libvirt-x64" {
  boot_command           = ["<tab> ", "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.fedora27.vagrant.ks ", "biosdevname=0 ", "net.ifnames=0 ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:2b93836c38833b26891345388ff5ddea60529b27a616b4539d432a3520d1c90b"
  iso_url                = "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/27/Server/x86_64/iso/Fedora-Server-netinst-x86_64-27-1.6.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-fedora27-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-fedora27-libvirt-x64"
}

source "qemu" "generic-fedora28-libvirt-x64" {
  boot_command           = ["<tab> ", "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.fedora28.vagrant.ks ", "biosdevname=0 ", "net.ifnames=0 ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:ea1efdc692356b3346326f82e2f468903e8da59324fdee8b10eac4fea83f23fe"
  iso_url                = "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/28/Server/x86_64/iso/Fedora-Server-netinst-x86_64-28-1.1.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-fedora28-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-fedora28-libvirt-x64"
}

source "qemu" "generic-fedora29-libvirt-x64" {
  boot_command           = ["<tab> ", "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.fedora29.vagrant.ks ", "biosdevname=0 ", "net.ifnames=0 ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:aa7fb0e6e5b71774ebdaab0dae76bdd9246a5bc7aedc28b7f1103aaaf9750654"
  iso_url                = "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/29/Server/x86_64/iso/Fedora-Server-netinst-x86_64-29-1.2.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-fedora29-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-fedora29-libvirt-x64"
}

source "qemu" "generic-fedora30-libvirt-x64" {
  boot_command           = ["<tab> ", "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.fedora30.vagrant.ks ", "biosdevname=0 ", "net.ifnames=0 ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:5e4eac4566d8c572bfb3bcf54b7d6c82006ec3c6c882a2c9235c6d3494d7b100"
  iso_url                = "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/30/Server/x86_64/iso/Fedora-Server-netinst-x86_64-30-1.2.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-fedora30-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-fedora30-libvirt-x64"
}

source "qemu" "generic-fedora31-libvirt-x64" {
  boot_command           = ["<tab> ", "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.fedora31.vagrant.ks ", "biosdevname=0 ", "net.ifnames=0 ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:5be8debd3e8fb4e86b9fbf67c7eb66ea598d2b7ad0c7ba8d505ce88067b43444"
  iso_url                = "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/31/Server/x86_64/iso/Fedora-Server-netinst-x86_64-31-1.9.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-fedora31-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-fedora31-libvirt-x64"
}

source "qemu" "generic-fedora32-libvirt-x64" {
  boot_command           = ["<tab> ", "<wait> text net.ifnames=0 ", "<wait>inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.fedora32.vagrant.ks ", "<wait><enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:7f4afd2a26c718f9f15e4bbfd9c2e8849f81036d2a82a4e81fa4a313a833da9c"
  iso_url                = "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/32/Server/x86_64/iso/Fedora-Server-netinst-x86_64-32-1.6.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-fedora32-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-fedora32-libvirt-x64"
}

source "qemu" "generic-fedora33-libvirt-x64" {
  boot_command           = ["<tab> ", "<wait> text net.ifnames=0 ", "<wait>inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.fedora33.vagrant.ks ", "<wait><enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:1f1f018e78f0cc23d08db0c85952344ea5c200e67b672da5b07507c066a52ccf"
  iso_url                = "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/33/Server/x86_64/iso/Fedora-Server-netinst-x86_64-33-1.2.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-fedora33-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-fedora33-libvirt-x64"
}

source "qemu" "generic-fedora34-libvirt-x64" {
  boot_command           = ["<tab> ", "<wait> text net.ifnames=0 ", "<wait>inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.fedora34.vagrant.ks ", "<wait><enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:e1a38b9faa62f793ad4561b308c31f32876cfaaee94457a7a9108aaddaeec406"
  iso_url                = "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/34/Server/x86_64/iso/Fedora-Server-netinst-x86_64-34-1.2.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-fedora34-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-fedora34-libvirt-x64"
}

source "qemu" "generic-fedora35-libvirt-x64" {
  boot_command           = ["<tab> ", "<wait> text net.ifnames=0 ", "<wait>inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.fedora35.vagrant.ks ", "<wait><enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:dd35f955dd5a7054213a0098c6ee737ff116aa3090fc6dbfe89d424b5c3552dd"
  iso_url                = "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/35/Server/x86_64/iso/Fedora-Server-netinst-x86_64-35-1.2.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-fedora35-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-fedora35-libvirt-x64"
}

source "qemu" "generic-fedora36-libvirt-x64" {
  boot_command           = ["<tab> ", "<wait> text net.ifnames=0 ", "<wait>inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.fedora36.vagrant.ks ", "<wait><enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:421c4c6e23d72e4669a55e7710562287ecd9308b3d314329960f586b89ccca19"
  iso_url                = "https://dl.fedoraproject.org/pub/archive/fedora/linux/releases/36/Server/x86_64/iso/Fedora-Server-netinst-x86_64-36-1.5.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-fedora36-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-fedora36-libvirt-x64"
}

source "qemu" "generic-fedora37-libvirt-x64" {
  boot_command           = ["c<wait>", "insmod all_video<enter><wait>", "set gfxpayload=keep<enter><wait>", "insmod increment<enter><wait>", "insmod xfs<enter><wait>", "insmod diskfilter<enter><wait>", "insmod mdraid1x<enter><wait>", "insmod fat<enter><wait>", "insmod blscfg<enter><wait>", "insmod gzio<enter><wait>", "insmod part_gpt<enter><wait>", "insmod ext2<enter><wait>", "insmod chain<enter><wait>", "search --no-floppy --set=root -l 'Fedora-S-dvd-x86_64-37'<enter><wait>", "linux /images/pxeboot/vmlinuz inst.stage2=hd:LABEL=Fedora-S-dvd-x86_64-37 rd.live.check ", "net.ifnames=0 inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.fedora37.vagrant.ks<enter><wait>", "initrd /images/pxeboot/initrd.img<enter><wait10>", "boot<enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:149d4bae999022b07bd40f8272f6208bc28884dad5110c63e915d37458e6abc0"
  iso_url                = "https://dl.fedoraproject.org/pub/fedora/linux/releases/37/Server/x86_64/iso/Fedora-Server-netinst-x86_64-37-1.7.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-fedora37-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-fedora37-libvirt-x64"
}

source "qemu" "generic-fedora38-libvirt-x64" {
  boot_command           = ["c<wait>", "insmod all_video<enter><wait>", "set gfxpayload=keep<enter><wait>", "insmod increment<enter><wait>", "insmod xfs<enter><wait>", "insmod diskfilter<enter><wait>", "insmod mdraid1x<enter><wait>", "insmod fat<enter><wait>", "insmod blscfg<enter><wait>", "insmod gzio<enter><wait>", "insmod part_gpt<enter><wait>", "insmod ext2<enter><wait>", "insmod chain<enter><wait>", "search --no-floppy --set=root -l 'Fedora-S-dvd-x86_64-38'<enter><wait>", "linux /images/pxeboot/vmlinuz inst.stage2=hd:LABEL=Fedora-S-dvd-x86_64-38 rd.live.check ", "net.ifnames=0 inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.fedora38.vagrant.ks<enter><wait>", "initrd /images/pxeboot/initrd.img<enter><wait10>", "boot<enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:192af621553aa32154697029e34cbe30152a9e23d72d55f31918b166979bbcf5"
  iso_url                = "https://dl.fedoraproject.org/pub/fedora/linux/releases/38/Server/x86_64/iso/Fedora-Server-netinst-x86_64-38-1.6.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-fedora38-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-fedora38-libvirt-x64"
}

source "qemu" "generic-fedora39-libvirt-x64" {
  boot_command           = ["c<wait>", "insmod all_video<enter><wait>", "set gfxpayload=keep<enter><wait>", "insmod increment<enter><wait>", "insmod xfs<enter><wait>", "insmod diskfilter<enter><wait>", "insmod mdraid1x<enter><wait>", "insmod fat<enter><wait>", "insmod blscfg<enter><wait>", "insmod gzio<enter><wait>", "insmod part_gpt<enter><wait>", "insmod ext2<enter><wait>", "insmod chain<enter><wait>", "search --no-floppy --set=root -l 'Fedora-S-dvd-x86_64-39'<enter><wait>", "linux /images/pxeboot/vmlinuz inst.stage2=hd:LABEL=Fedora-S-dvd-x86_64-39 rd.live.check ", "net.ifnames=0 inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.fedora39.vagrant.x64.ks<enter><wait>", "initrd /images/pxeboot/initrd.img<enter><wait10>", "boot<enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:61576ae7170e35210f03aae3102048f0a9e0df7868ac726908669b4ef9cc22e9"
  iso_url                = "https://dl.fedoraproject.org/pub/fedora/linux/releases/39/Server/x86_64/iso/Fedora-Server-netinst-x86_64-39-1.5.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-fedora39-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-fedora39-libvirt-x64"
}

source "qemu" "generic-freebsd11-libvirt-x64" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "boot -s<enter>", "<wait10><wait10><wait10>", "/bin/sh<enter><wait10>", "mdmfs -s 100m md1 /tmp<enter><wait>", "mdmfs -s 100m md2 /mnt<enter><wait>", "dhclient -l /tmp/dhclient.lease.vtnet0 vtnet0<enter><wait5>", "fetch -o /tmp/installerconfig http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.freebsd11.vagrant.cfg<enter><wait5>", "sh -c ' { bsdinstall script /tmp/installerconfig 2>&1 && reboot ; } | tee /tmp/installerconfig.log ' <enter><wait10>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "1s"
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
  iso_checksum           = "sha256:d76c1ded99b2c1005b1ff94cc0c811fbcd8a2d04196432009ab5f203c2146914"
  iso_url                = "https://archive.freebsd.org/old-releases/ISO-IMAGES/11.4/FreeBSD-11.4-RELEASE-amd64-disc1.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-freebsd11-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "shutdown -p now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-freebsd11-libvirt-x64"
}

source "qemu" "generic-freebsd12-libvirt-x64" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "boot -s<enter>", "<wait10><wait10><wait10>", "/bin/sh<enter><wait10>", "mdmfs -s 100m md1 /tmp<enter><wait>", "mdmfs -s 100m md2 /mnt<enter><wait>", "dhclient -l /tmp/dhclient.lease.vtnet0 vtnet0<enter><wait5>", "fetch -o /tmp/installerconfig http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.freebsd12.vagrant.cfg<enter><wait5>", "sh -c ' { bsdinstall script /tmp/installerconfig 2>&1 && reboot ; } | tee /tmp/installerconfig.log ' <enter><wait10>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "1s"
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
  iso_checksum           = "sha256:606435637b76991f96df68f561badf03266f3d5452e9f72ed9b130d96b188800"
  iso_url                = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.4/FreeBSD-12.4-RELEASE-amd64-disc1.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-freebsd12-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "shutdown -p now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-freebsd12-libvirt-x64"
}

source "qemu" "generic-freebsd13-libvirt-x64" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "boot -s<enter>", "<wait10><wait10><wait10>", "/bin/sh<enter><wait10>", "mdmfs -s 100m md1 /tmp<enter><wait>", "mdmfs -s 100m md2 /mnt<enter><wait>", "dhclient -l /tmp/dhclient.lease.vtnet0 vtnet0<enter><wait5>", "fetch -o /tmp/installerconfig http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.freebsd13.vagrant.cfg<enter><wait5>", "sh -c ' { bsdinstall script /tmp/installerconfig 2>&1 && reboot ; } | tee /tmp/installerconfig.log ' <enter><wait10>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "1s"
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
  iso_checksum           = "sha256:b76ab084e339ee05f59be81354c8cb7dfadf9518e0548f88017d2759a910f17c"
  iso_url                = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/13.2/FreeBSD-13.2-RELEASE-amd64-disc1.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-freebsd13-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "shutdown -p now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-freebsd13-libvirt-x64"
}

source "qemu" "generic-freebsd14-libvirt-x64" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "boot -s<enter>", "<wait10><wait10><wait10>", "/bin/sh<enter><wait10>", "mdmfs -s 100m md1 /tmp<enter><wait>", "mdmfs -s 100m md2 /mnt<enter><wait>", "dhclient -l /tmp/dhclient.lease.vtnet0 vtnet0<enter><wait5>", "fetch -o /tmp/installerconfig http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.freebsd14.vagrant.cfg<enter><wait5>", "sh -c ' { bsdinstall script /tmp/installerconfig 2>&1 && reboot ; } | tee /tmp/installerconfig.log ' <enter><wait10>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "1s"
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
  iso_checksum           = "sha256:7200214030125877561e70718781b435b703180c12575966ad1c7584a3e60dc6"
  iso_url                = "https://ftp.freebsd.org/pub/FreeBSD/releases/ISO-IMAGES/14.0/FreeBSD-14.0-RELEASE-amd64-disc1.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-freebsd14-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "shutdown -p now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-freebsd14-libvirt-x64"
}

source "qemu" "generic-gentoo-libvirt-x64" {
  boot_command           = ["passwd root<enter><wait><wait><wait>", "vagrant<enter><wait>", "vagrant<enter><wait>", "curl -O 'http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.gentoo.vagrant{,.chroot}.x64.sh'<enter><wait>", "bash generic.gentoo.vagrant.x64.sh<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "180s"
  cpus                   = 8
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
  iso_checksum           = "sha256:e4426ff82b30b57ddf362df7590a2ed2f93098cd0256cdfc4dc70cac02ee1132"
  iso_url                = "https://mirrors.kernel.org/gentoo/releases/amd64/autobuilds/current-install-amd64-minimal/install-amd64-minimal-20240114T164819Z.iso"
  memory                 = 8192
  net_device             = "virtio-net"
  output_directory       = "output/generic-gentoo-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "shutdown -hP now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "9800s"
  ssh_username           = "root"
  vm_name                = "generic-gentoo-libvirt-x64"
}

source "qemu" "generic-hardenedbsd-libvirt-x64" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "boot -s<enter>", "<wait10><wait10><wait10><wait10><wait10><wait10><wait10><wait10><wait10>", "/bin/sh<enter><wait10>", "mdmfs -s 100m md1 /tmp<enter><wait>", "mdmfs -s 100m md2 /mnt<enter><wait>", "dhclient -l /tmp/dhclient.lease.vtnet0 vtnet0<enter><wait5>", "fetch -o /tmp/installerconfig http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.hardenedbsd.vagrant.cfg<enter><wait10>", "sh -c ' { bsdinstall script /tmp/installerconfig 2>&1 && reboot ; } | tee /tmp/installerconfig.log ' <enter><wait10>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "1s"
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
  iso_checksum           = "sha256:cf5b609b7099f71e93e30baa74c4b4887bed619fb33727c053189d98d57823e6"
  iso_url                = "https://mirror.laylo.nl/pub/hardenedbsd/14-stable/amd64/amd64/installer/build-11/disc1.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-hardenedbsd-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "shutdown -p now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-hardenedbsd-libvirt-x64"
}

source "qemu" "generic-hardenedbsd11-libvirt-x64" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "boot -s<enter>", "<wait10><wait10><wait10><wait10><wait10><wait10><wait10><wait10><wait10>", "/bin/sh<enter><wait10>", "mdmfs -s 100m md1 /tmp<enter><wait>", "mdmfs -s 100m md2 /mnt<enter><wait>", "dhclient -l /tmp/dhclient.lease.vtnet0 vtnet0<enter><wait5>", "fetch -o /tmp/installerconfig http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.hardenedbsd11.vagrant.cfg<enter><wait5>", "sh -c ' { bsdinstall script /tmp/installerconfig 2>&1 && reboot ; } | tee /tmp/installerconfig.log ' <enter><wait10>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "1s"
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
  iso_checksum           = "sha256:8b2c90dc41ec68b561028af885eecb66bfd36223970d1c594923d1d54bf83467"
  iso_url                = "https://mirrors.lavabit.com/hardenedbsd-archive/releases/amd64/amd64/ISO-IMAGES/hardenedbsd-11-stable-20190205-1/HardenedBSD-11-STABLE-v1100056.13-amd64-disc1.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-hardenedbsd11-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "shutdown -p now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-hardenedbsd11-libvirt-x64"
}

source "qemu" "generic-hardenedbsd12-libvirt-x64" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "boot -s<enter>", "<wait10><wait10><wait10><wait10><wait10><wait10><wait10><wait10><wait10>", "/bin/sh<enter><wait10>", "mdmfs -s 100m md1 /tmp<enter><wait>", "mdmfs -s 100m md2 /mnt<enter><wait>", "dhclient -l /tmp/dhclient.lease.vtnet0 vtnet0<enter><wait5>", "fetch -o /tmp/installerconfig http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.hardenedbsd12.vagrant.cfg<enter><wait10>", "sh -c ' { bsdinstall script /tmp/installerconfig 2>&1 && reboot ; } | tee /tmp/installerconfig.log ' <enter><wait10>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "1s"
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
  iso_checksum           = "sha256:029225eaf92ba8e7ed7a7395f45492d09bc9a949488ecb9a5ca54df7c9f89661"
  iso_url                = "https://mirrors.lavabit.com/hardenedbsd-archive/releases/amd64/amd64/ISO-IMAGES/hardenedbsd-12-stable-20190807-1/HardenedBSD-12-STABLE-v1200059.3-amd64-disc1.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-hardenedbsd12-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "shutdown -p now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-hardenedbsd12-libvirt-x64"
}

source "qemu" "generic-hardenedbsd13-libvirt-x64" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "boot -s<enter>", "<wait10><wait10><wait10><wait10><wait10><wait10><wait10><wait10><wait10>", "/bin/sh<enter><wait10>", "mdmfs -s 100m md1 /tmp<enter><wait>", "mdmfs -s 100m md2 /mnt<enter><wait>", "dhclient -l /tmp/dhclient.lease.vtnet0 vtnet0<enter><wait5>", "fetch -o /tmp/installerconfig http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.hardenedbsd13.vagrant.cfg<enter><wait10>", "sh -c ' { bsdinstall script /tmp/installerconfig 2>&1 && reboot ; } | tee /tmp/installerconfig.log ' <enter><wait10>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "1s"
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
  iso_checksum           = "sha256:a449b42b793301ad7e79755b932b13a5a7e5f8c08fc15011fff041ed9422a2d9"
  iso_url                = "https://mirror.laylo.nl/pub/hardenedbsd/13-stable/amd64/amd64/installer/build-30/disc1.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-hardenedbsd13-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "shutdown -p now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-hardenedbsd13-libvirt-x64"
}

source "qemu" "generic-netbsd8-libvirt-x64" {
  boot_command           = ["<enter><wait10>", "<enter><wait10>", "e<enter><wait10>", "<enter><wait10>", "IF=`ifconfig | head -1 | awk -F':' '{print $1}'`<enter><wait10>", "dhclient $IF<enter><wait10>", "ftp -o /tmp/install-script.sh http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.netbsd8.install.sh<enter><wait10>", "TERM=wsvt25 /usr/sbin/sysinst && sh /tmp/install-script.sh && reboot<enter><wait10>", "a<wait><enter><wait10>", "a<wait><enter><wait10>", "a<wait><enter><wait10>", "b<wait><enter><wait10>", "a<wait><enter><wait10>", "a<wait><enter><wait10>", "b<wait><enter><wait10>", "a<wait><enter><wait10>", "b<wait><enter><wait10>", "x<wait><enter><wait10>", "<wait><enter><wait10>", "b<wait><enter><wait60>", "<wait60><wait60><wait60>", "a<wait><enter><wait10>", "x<wait><enter><wait10>", "b<wait><enter><wait10>", "a<wait><enter><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait><enter><wait10>", "d<wait><enter><wait10>", "a<wait><enter><wait10>", "vagrant<enter><wait10>", "vagrant<enter><wait10>", "vagrant<enter><wait10>", "g<wait><enter><wait10>", "x<wait><enter><wait10>", "<wait><enter><wait10>", "x<wait><enter><wait10>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "40s"
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
  iso_checksum           = "sha256:55d03c51d5b94cf7f03a29c1ee7e9f49d6b0ec4c2e1b1a2523c03956b70a1841"
  iso_url                = "https://ftp.netbsd.org/pub/NetBSD/iso/8.2/NetBSD-8.2-amd64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-netbsd8-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "/sbin/poweroff"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-netbsd8-libvirt-x64"
}

source "qemu" "generic-netbsd9-libvirt-x64" {
  boot_command           = ["<enter><wait10>", "<enter><wait10>", "e<enter><wait10>", "<enter><wait10>", "IF=`ifconfig | head -1 | awk -F':' '{print $1}'`<enter><wait10>", "/sbin/dhcpcd -d -n $IF<enter><wait10>", "ftp -o /tmp/install-script.sh http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.netbsd9.install.sh<enter><wait10>", "TERM=wsvt25 /usr/sbin/sysinst && sh /tmp/install-script.sh && reboot<enter><wait10>", "a<wait><enter><wait10>", "a<wait><enter><wait10>", "a<wait><enter><wait10>", "b<wait><enter><wait10>", "a<wait><enter><wait10>", "a<wait><enter><wait10>", "a<wait><enter><wait10>", "b<wait><enter><wait10>", "x<wait><enter><wait10>", "b<wait><enter><wait60>", "<wait60><wait60><wait60>", "a<wait><enter><wait10>", "b<wait><enter><wait30>", "a<wait><enter><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait10><wait10><wait10><wait10><wait10><wait10>", "<wait><enter><wait10>", "d<wait><enter><wait10>", "a<wait><enter><wait10>", "vagrant<enter><wait10>", "vagrant<enter><wait10>", "vagrant<enter><wait10>", "g<wait><enter><wait10>", "x<wait><enter><wait10>", "<wait><enter><wait10>", "x<wait><enter><wait10>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "40s"
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
  iso_checksum           = "sha256:7e7f03bfd0584480cd11ed8833963310e34361d105498a028a2ebf3c10354171"
  iso_url                = "https://ftp.netbsd.org/pub/NetBSD/iso/9.3/NetBSD-9.3-amd64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-netbsd9-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "/sbin/poweroff"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-netbsd9-libvirt-x64"
}

source "qemu" "generic-openbsd6-libvirt-x64" {
  boot_command           = ["S<enter><wait5>", "dhclient vio0<enter><wait10>", "ftp -o /install.conf http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.openbsd6.install.cfg<enter><wait5>", "ftp -o /install-chroot.sh http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.openbsd6.install.chroot.sh<enter><wait5>", "/install -a -f /install.conf -m install && chroot /mnt < /install-chroot.sh && reboot<enter>"]
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
  iso_checksum           = "sha256:b391350d72a4fcab550033c830a17612cff65ebdb6de428732d9b15f780bf9c2"
  iso_url                = "https://mirrors.lavabit.com/openbsd/6.9/amd64/cd69.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-openbsd6-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "shutdown -h -p now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-openbsd6-libvirt-x64"
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
  iso_checksum           = "sha256:9376f0cab131eca7f3e4d0787a400f602c2a3a8e671bed04d2178efd25182369"
  iso_url                = "https://ftp.nluug.nl/OpenBSD/7.4/amd64/cd74.iso"
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

source "qemu" "generic-opensuse15-libvirt-x64" {
  boot_command           = ["<esc><enter><wait>", "linux netsetup=dhcp lang=en_US textmode=1 ssh=0 sshd=0 <wait>", "autoyast=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.opensuse15.vagrant.cfg<wait>", "<enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:53bcbcb82361c5261c9d0994ab0f94101bf28e61c06fe12d320984601be35a8f"
  iso_url                = "https://download.opensuse.org/distribution/leap/15.5/iso/openSUSE-Leap-15.5-DVD-x86_64-Build491.1-Media.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-opensuse15-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S /sbin/halt -h -p"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-opensuse15-libvirt-x64"
}

source "qemu" "generic-opensuse42-libvirt-x64" {
  boot_command           = ["<esc><enter><wait>", "linux netsetup=dhcp install=https://ftp5.gwdg.de/pub/opensuse/discontinued/distribution/leap/42.3/repo/oss/ lang=en_US  textmode=1 <wait>", "autoyast=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.opensuse42.vagrant.cfg<wait>", "<enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:d1a17116cf33a5582b83ef479d7b151b33938e60f07eebc544abf162e2aa5c12"
  iso_url                = "https://ftp5.gwdg.de/pub/opensuse/discontinued/distribution/leap/42.3/iso/openSUSE-Leap-42.3-NET-x86_64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-opensuse42-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S /sbin/halt -h -p"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-opensuse42-libvirt-x64"
}

source "qemu" "generic-oracle6-libvirt-x64" {
  boot_command           = ["<tab> text biosdevname=0 net.ifnames=0 ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.oracle6.vagrant.ks<enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:625044388ee60a031965a42a32f4c1de0c029268975edcd542fd14160e0dadcb"
  iso_url                = "https://yum.oracle.com/ISOS/OracleLinux/OL6/u10/x86_64/OracleLinux-R6-U10-Server-x86_64-dvd.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-oracle6-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-oracle6-libvirt-x64"
}

source "qemu" "generic-oracle7-libvirt-x64" {
  boot_command           = ["<tab> text biosdevname=0 net.ifnames=0 ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.oracle7.vagrant.ks<enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:6da0323423f3a52d20d1021c2651885052319ca4ace7532859d8d20640829004"
  iso_url                = "https://yum.oracle.com/ISOS/OracleLinux/OL7/u9/x86_64/x86_64-boot-uek.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-oracle7-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-oracle7-libvirt-x64"
}

source "qemu" "generic-oracle8-libvirt-x64" {
  boot_command           = ["<tab> text biosdevname=0 net.ifnames=0 ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.oracle8.vagrant.ks<enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:67929eda55820fa8f379234de2b4488d054edd94efe2d5110b0e7cc7b6137700"
  iso_url                = "https://yum.oracle.com/ISOS/OracleLinux/OL8/u9/x86_64/x86_64-boot-uek.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-oracle8-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-oracle8-libvirt-x64"
}

source "qemu" "generic-oracle9-libvirt-x64" {
  boot_command           = ["<tab> net.ifnames=0 inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.oracle9.vagrant.ks vga=792 <enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:22c68f84230b375aeb8fa035fab6f5f4ef6505c036ee068cd8fab5f0675b2c78"
  iso_url                = "https://yum.oracle.com/ISOS/OracleLinux/OL9/u3/x86_64/OracleLinux-R9-U3-x86_64-boot.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-oracle9-libvirt-x64"
  qemuargs               = [["-cpu", "max"]]
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-oracle9-libvirt-x64"
}

source "qemu" "generic-rhel6-libvirt-x64" {
  boot_command           = ["<tab> text biosdevname=0 net.ifnames=0 ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.rhel6.vagrant.ks<enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:1e15f9202d2cdd4b2bdf9d6503a8543347f0cb8cc06ba9a0dfd2df4fdef5c727"
  iso_url                = "https://archive.org/download/rhel-server-6.10-x86_64-dvd/rhel-server-6.10-x86_64-dvd.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-rhel6-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-rhel6-libvirt-x64"
}

source "qemu" "generic-rhel7-libvirt-x64" {
  boot_command           = ["<tab> text biosdevname=0 net.ifnames=0 ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.rhel7.vagrant.ks<enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:19d653ce2f04f202e79773a0cbeda82070e7527557e814ebbce658773fbe8191"
  iso_url                = "https://archive.org/download/rhel-server-7.9-x86_64-dvd/rhel-server-7.9-x86_64-dvd.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-rhel7-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-rhel7-libvirt-x64"
}

source "qemu" "generic-rhel8-libvirt-x64" {
  boot_command           = ["<tab> text biosdevname=0 net.ifnames=0 ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.rhel8.vagrant.ks<enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:c4fd0632ce15a7d56e1d174176456943bd48306f9d35bcecbcb0a1dc49088e23"
  iso_url                = "https://archive.org/download/rhel-8.9/rhel-8.9-x86_64-dvd.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-rhel8-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-rhel8-libvirt-x64"
}

source "qemu" "generic-rhel9-libvirt-x64" {
  boot_command           = ["<tab> net.ifnames=0 inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.rhel9.vagrant.ks vga=792 <enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:5c802147aa58429b21e223ee60e347e850d6b0d8680930c4ffb27340ffb687a8"
  iso_url                = "https://archive.org/download/rhel-9.3/rhel-9.3-x86_64-dvd.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-rhel9-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  qemuargs               = [["-cpu", "max"]]
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-rhel9-libvirt-x64"
}

source "qemu" "generic-rocky8-libvirt-x64" {
  boot_command           = ["<tab> text biosdevname=0 net.ifnames=0 ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.rocky8.vagrant.ks<enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:88baefca6f0e78b53613773954e0d7c2d8d28ad863f40623db75c40f505b5105"
  iso_url                = "https://ftp5.gwdg.de/pub/linux/rocky/8.9/isos/x86_64/Rocky-8.9-x86_64-boot.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-rocky8-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-rocky8-libvirt-x64"
}

source "qemu" "generic-rocky9-libvirt-x64" {
  boot_command           = ["<tab> net.ifnames=0 inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.rocky9.vagrant.ks vga=792 <enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:eb096f0518e310f722d5ebd4c69f0322df4fc152c6189f93c5c797dc25f3d2e1"
  iso_url                = "https://ftp5.gwdg.de/pub/linux/rocky/9.3/isos/x86_64/Rocky-9.3-x86_64-boot.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-rocky9-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  qemuargs               = [["-cpu", "max"]]
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-rocky9-libvirt-x64"
}

source "qemu" "generic-ubuntu1604-libvirt-x64" {
  boot_command           = ["<enter><wait>", "<f6><esc>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs>", "/install/vmlinuz ", "initrd=/install/initrd.gz ", "auto-install/enable=true ", "debconf/priority=critical ", "ipv6.disable_ipv6=1 net.ifnames=0 biosdevname=0 preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.ubuntu1604.vagrant.cfg<wait> ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:b23488689e16cad7a269eb2d3a3bf725d3457ee6b0868e00c8762d3816e25848"
  iso_url                = "https://mirrors.edge.kernel.org/ubuntu-releases/16.04.7/ubuntu-16.04.7-server-amd64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-ubuntu1604-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-ubuntu1604-libvirt-x64"
}

source "qemu" "generic-ubuntu1610-libvirt-x64" {
  boot_command           = ["<esc><wait>", "<esc><wait>", "<enter><wait>", "/install/vmlinuz ", "initrd=/install/initrd.gz ", "auto-install/enable=true ", "debconf/priority=critical ", "ipv6.disable_ipv6=1 net.ifnames=0 biosdevname=0 preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.ubuntu1610.vagrant.cfg<wait> ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:72b0d421da77f1e0c549b4efe6fc6c184e9909d6792f0d1e59b56d63e9705659"
  iso_url                = "https://old-releases.ubuntu.com/releases/16.10/ubuntu-16.10-server-amd64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-ubuntu1610-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-ubuntu1610-libvirt-x64"
}

source "qemu" "generic-ubuntu1704-libvirt-x64" {
  boot_command           = ["<esc><wait>", "<esc><wait>", "<enter><wait>", "/install/vmlinuz ", "initrd=/install/initrd.gz ", "auto-install/enable=true ", "debconf/priority=critical ", "ipv6.disable_ipv6=1 net.ifnames=0 biosdevname=0 preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.ubuntu1704.vagrant.cfg<wait> ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:ca5d9a8438e2434b9a3ac2be67b5c5fa2c1f8e3e40b954519462935195464034"
  iso_url                = "https://old-releases.ubuntu.com/releases/17.04/ubuntu-17.04-server-amd64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-ubuntu1704-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-ubuntu1704-libvirt-x64"
}

source "qemu" "generic-ubuntu1710-libvirt-x64" {
  boot_command           = ["<esc><wait>", "<esc><wait>", "<enter><wait>", "/install/vmlinuz ", "initrd=/install/initrd.gz ", "auto-install/enable=true ", "debconf/priority=critical ", "ipv6.disable_ipv6=1 net.ifnames=0 biosdevname=0 preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.ubuntu1710.vagrant.cfg<wait> ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
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
  iso_checksum           = "sha256:8ff73f1b622276758475c3bd5190b382774626de5a82c50930519381f6c3a3f8"
  iso_url                = "https://old-releases.ubuntu.com/releases/17.10/ubuntu-17.10.1-server-amd64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-ubuntu1710-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-ubuntu1710-libvirt-x64"
}

source "qemu" "generic-ubuntu1804-libvirt-x64" {
  boot_command           = ["<tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait>", "<esc><f6><esc>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "/install/vmlinuz ", "initrd=/install/initrd.gz ", "fb=false ", "auto-install/enable=true ", "debconf/priority=critical ", "console-setup/ask_detect=false ", "debconf/frontend=noninteractive ", "ipv6.disable_ipv6=1 net.ifnames=0 biosdevname=0 preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.ubuntu1804.vagrant.cfg<wait> ", " --- <enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "1s"
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
  iso_checksum           = "sha256:f5cbb8104348f0097a8e513b10173a07dbc6684595e331cb06f93f385d0aecf6"
  iso_url                = "https://cdimage.ubuntu.com/ubuntu/releases/18.04.6/release/ubuntu-18.04.6-server-amd64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-ubuntu1804-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-ubuntu1804-libvirt-x64"
}

source "qemu" "generic-ubuntu1810-libvirt-x64" {
  boot_command           = ["<tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait>", "<esc><f6><esc>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "/install/vmlinuz ", "initrd=/install/initrd.gz ", "fb=false ", "auto-install/enable=true ", "debconf/priority=critical ", "console-setup/ask_detect=false ", "debconf/frontend=noninteractive ", "ipv6.disable_ipv6=1 net.ifnames=0 biosdevname=0 preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.ubuntu1810.vagrant.cfg<wait> ", " --- <enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "1s"
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
  iso_checksum           = "sha256:cf9250781dadd919f23c9d9612212cad653e35fccc2fbcf6853f67ad09e067ba"
  iso_url                = "https://old-releases.ubuntu.com/releases/18.10/ubuntu-18.10-server-amd64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-ubuntu1810-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-ubuntu1810-libvirt-x64"
}

source "qemu" "generic-ubuntu1904-libvirt-x64" {
  boot_command           = ["<tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait>", "<esc><f6><esc>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "/install/vmlinuz ", "initrd=/install/initrd.gz ", "fb=false ", "auto-install/enable=true ", "debconf/priority=critical ", "console-setup/ask_detect=false ", "debconf/frontend=noninteractive ", "ipv6.disable_ipv6=1 net.ifnames=0 biosdevname=0 preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.ubuntu1904.vagrant.cfg<wait> ", " --- <enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "1s"
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
  iso_checksum           = "sha256:7e8a0d07522f591dfee9bc9fcd7c05466763161e6cb0117906655bce1750b2fa"
  iso_url                = "https://old-releases.ubuntu.com/releases/19.04/ubuntu-19.04-server-amd64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-ubuntu1904-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-ubuntu1904-libvirt-x64"
}

source "qemu" "generic-ubuntu1910-libvirt-x64" {
  boot_command           = ["<tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait>", "<esc><f6><esc>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "/install/vmlinuz ", "initrd=/install/initrd.gz ", "fb=false ", "auto-install/enable=true ", "debconf/priority=critical ", "console-setup/ask_detect=false ", "debconf/frontend=noninteractive ", "ipv6.disable_ipv6=1 net.ifnames=0 biosdevname=0 preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.ubuntu1910.vagrant.cfg<wait> ", " --- <enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "1s"
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
  iso_checksum           = "sha256:921fd8b271c04aa86a321cc35b40e677f9b85f7903bf2204efb2389b0f0a64c1"
  iso_url                = "https://archive.org/download/ubuntu-19.10-server-amd64/ubuntu-19.10-server-amd64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-ubuntu1910-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-ubuntu1910-libvirt-x64"
}

source "qemu" "generic-ubuntu2004-libvirt-x64" {
  boot_command           = ["<tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait>", "<esc><f6><esc>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "/install/vmlinuz ", "initrd=/install/initrd.gz ", "fb=false ", "auto-install/enable=true ", "debconf/priority=critical ", "console-setup/ask_detect=false ", "debconf/frontend=noninteractive ", "ipv6.disable_ipv6=1 net.ifnames=0 biosdevname=0 preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.ubuntu2004.vagrant.cfg<wait> ", " --- <enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "1s"
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
  iso_checksum           = "sha256:f11bda2f2caed8f420802b59f382c25160b114ccc665dbac9c5046e7fceaced2"
  iso_url                = "https://cdimage.ubuntu.com/ubuntu-legacy-server/releases/20.04/release/ubuntu-20.04.1-legacy-server-amd64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-ubuntu2004-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-ubuntu2004-libvirt-x64"
}

source "qemu" "generic-ubuntu2010-libvirt-x64" {
  boot_command           = ["<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "c<wait10>", "set gfxpayload=keep<enter><wait10>", "linux /casper/vmlinuz autoinstall quiet net.ifnames=0 biosdevname=0 ", "ds=\"nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.ubuntu2010.vagrant.\" --- <enter><wait10>", "initrd /casper/initrd<enter><wait10>", "boot<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "10s"
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
  iso_checksum           = "sha256:defdc1ad3af7b661fe2b4ee861fb6fdb5f52039389ef56da6efc05e6adfe3d45"
  iso_url                = "https://old-releases.ubuntu.com/releases/20.10/ubuntu-20.10-live-server-amd64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-ubuntu2010-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-ubuntu2010-libvirt-x64"
}

source "qemu" "generic-ubuntu2104-libvirt-x64" {
  boot_command           = ["<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "c<wait10>", "set gfxpayload=keep<enter><wait10>", "linux /casper/vmlinuz autoinstall quiet net.ifnames=0 biosdevname=0 ", "ds=\"nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.ubuntu2104.vagrant.\" --- <enter><wait10>", "initrd /casper/initrd<enter><wait10>", "boot<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "10s"
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
  iso_checksum           = "sha256:e4089c47104375b59951bad6c7b3ee5d9f6d80bfac4597e43a716bb8f5c1f3b0"
  iso_url                = "https://old-releases.ubuntu.com/releases/21.04/ubuntu-21.04-live-server-amd64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-ubuntu2104-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-ubuntu2104-libvirt-x64"
}

source "qemu" "generic-ubuntu2110-libvirt-x64" {
  boot_command           = ["<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "c<wait10>", "set gfxpayload=keep<enter><wait10>", "linux /casper/vmlinuz autoinstall quiet net.ifnames=0 biosdevname=0 ", "ds=\"nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.ubuntu2110.vagrant.\" --- <enter><wait10>", "initrd /casper/initrd<enter><wait10>", "boot<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "10s"
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
  iso_checksum           = "sha256:e84f546dfc6743f24e8b1e15db9cc2d2c698ec57d9adfb852971772d1ce692d4"
  iso_url                = "https://old-releases.ubuntu.com/releases/21.10/ubuntu-21.10-live-server-amd64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-ubuntu2110-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-ubuntu2110-libvirt-x64"
}

source "qemu" "generic-ubuntu2204-libvirt-x64" {
  boot_command           = ["<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "c<wait10>", "set gfxpayload=keep<enter><wait10>", "linux /casper/vmlinuz autoinstall quiet net.ifnames=0 biosdevname=0 ", "cloud-config-url=\"http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.ubuntu2204.vagrant.cfg\" --- <enter><wait10>", "initrd /casper/initrd<enter><wait10>", "boot<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "10s"
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
  iso_checksum           = "sha256:a4acfda10b18da50e2ec50ccaf860d7f20b389df8765611142305c0e911d16fd"
  iso_url                = "https://releases.ubuntu.com/22.04/ubuntu-22.04.3-live-server-amd64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-ubuntu2204-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-ubuntu2204-libvirt-x64"
}

source "qemu" "generic-ubuntu2210-libvirt-x64" {
  boot_command           = ["<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "c<wait10>", "set gfxpayload=keep<enter><wait10>", "linux /casper/vmlinuz autoinstall quiet net.ifnames=0 biosdevname=0 ", "cloud-config-url=\"http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.ubuntu2210.vagrant.cfg\" --- <enter><wait10>", "initrd /casper/initrd<enter><wait10>", "boot<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "10s"
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
  iso_checksum           = "sha256:874452797430a94ca240c95d8503035aa145bd03ef7d84f9b23b78f3c5099aed"
  iso_url                = "https://releases.ubuntu.com/22.10/ubuntu-22.10-live-server-amd64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-ubuntu2210-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-ubuntu2210-libvirt-x64"
}

source "qemu" "generic-ubuntu2304-libvirt-x64" {
  boot_command           = ["<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "c<wait10>", "set gfxpayload=keep<enter><wait10>", "linux /casper/vmlinuz autoinstall quiet net.ifnames=0 biosdevname=0 ", "cloud-config-url=\"http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.ubuntu2304.vagrant.cfg\" --- <enter><wait10>", "initrd /casper/initrd<enter><wait10>", "boot<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "10s"
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
  iso_checksum           = "sha256:c7cda48494a6d7d9665964388a3fc9c824b3bef0c9ea3818a1be982bc80d346b"
  iso_url                = "https://releases.ubuntu.com/23.04/ubuntu-23.04-live-server-amd64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-ubuntu2304-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-ubuntu2304-libvirt-x64"
}

source "qemu" "generic-ubuntu2310-libvirt-x64" {
  boot_command           = ["<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "<tab><wait><tab><wait><tab><wait><tab><wait><tab><wait><tab><wait>", "c<wait10>", "set gfxpayload=keep<enter><wait10>", "linux /casper/vmlinuz autoinstall quiet net.ifnames=0 biosdevname=0 ", "cloud-config-url=\"http://{{ .HTTPIP }}:{{ .HTTPPort }}/generic.ubuntu2310.vagrant.cfg\" --- <enter><wait10>", "initrd /casper/initrd<enter><wait10>", "boot<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "10s"
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
  iso_checksum           = "sha256:d2fb80d9ce77511ed500bcc1f813e6f676d4a3577009dfebce24269ca23346a5"
  iso_url                = "https://releases.ubuntu.com/23.10.1/ubuntu-23.10-live-server-amd64.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/generic-ubuntu2310-libvirt-x64"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "generic-ubuntu2310-libvirt-x64"
}

build {
  sources = ["source.qemu.generic-alma8-libvirt-x64", "source.qemu.generic-alma9-libvirt-x64", "source.qemu.generic-alpine310-libvirt-x64", "source.qemu.generic-alpine311-libvirt-x64", "source.qemu.generic-alpine312-libvirt-x64", "source.qemu.generic-alpine313-libvirt-x64", "source.qemu.generic-alpine314-libvirt-x64", "source.qemu.generic-alpine315-libvirt-x64", "source.qemu.generic-alpine316-libvirt-x64", "source.qemu.generic-alpine317-libvirt-x64", "source.qemu.generic-alpine318-libvirt-x64", "source.qemu.generic-alpine319-libvirt-x64", "source.qemu.generic-alpine35-libvirt-x64", "source.qemu.generic-alpine36-libvirt-x64", "source.qemu.generic-alpine37-libvirt-x64", "source.qemu.generic-alpine38-libvirt-x64", "source.qemu.generic-alpine39-libvirt-x64", "source.qemu.generic-arch-libvirt-x64", "source.qemu.generic-centos6-libvirt-x64", "source.qemu.generic-centos7-libvirt-x64", "source.qemu.generic-centos8-libvirt-x64", "source.qemu.generic-centos8s-libvirt-x64", "source.qemu.generic-centos9s-libvirt-x64", "source.qemu.generic-debian10-libvirt-x64", "source.qemu.generic-debian11-libvirt-x64", "source.qemu.generic-debian12-libvirt-x64", "source.qemu.generic-debian8-libvirt-x64", "source.qemu.generic-debian9-libvirt-x64", "source.qemu.generic-devuan1-libvirt-x64", "source.qemu.generic-devuan2-libvirt-x64", "source.qemu.generic-devuan3-libvirt-x64", "source.qemu.generic-devuan4-libvirt-x64", "source.qemu.generic-devuan5-libvirt-x64", "source.qemu.generic-dragonflybsd-libvirt-x64", "source.qemu.generic-dragonflybsd5-libvirt-x64", "source.qemu.generic-dragonflybsd6-libvirt-x64", "source.qemu.generic-fedora-rawhide-libvirt-x64", "source.qemu.generic-fedora25-libvirt-x64", "source.qemu.generic-fedora26-libvirt-x64", "source.qemu.generic-fedora27-libvirt-x64", "source.qemu.generic-fedora28-libvirt-x64", "source.qemu.generic-fedora29-libvirt-x64", "source.qemu.generic-fedora30-libvirt-x64", "source.qemu.generic-fedora31-libvirt-x64", "source.qemu.generic-fedora32-libvirt-x64", "source.qemu.generic-fedora33-libvirt-x64", "source.qemu.generic-fedora34-libvirt-x64", "source.qemu.generic-fedora35-libvirt-x64", "source.qemu.generic-fedora36-libvirt-x64", "source.qemu.generic-fedora37-libvirt-x64", "source.qemu.generic-fedora38-libvirt-x64", "source.qemu.generic-fedora39-libvirt-x64", "source.qemu.generic-freebsd11-libvirt-x64", "source.qemu.generic-freebsd12-libvirt-x64", "source.qemu.generic-freebsd13-libvirt-x64", "source.qemu.generic-freebsd14-libvirt-x64", "source.qemu.generic-gentoo-libvirt-x64", "source.qemu.generic-hardenedbsd-libvirt-x64", "source.qemu.generic-hardenedbsd11-libvirt-x64", "source.qemu.generic-hardenedbsd12-libvirt-x64", "source.qemu.generic-hardenedbsd13-libvirt-x64", "source.qemu.generic-netbsd8-libvirt-x64", "source.qemu.generic-netbsd9-libvirt-x64", "source.qemu.generic-openbsd6-libvirt-x64", "source.qemu.generic-openbsd7-libvirt-x64", "source.qemu.generic-opensuse15-libvirt-x64", "source.qemu.generic-opensuse42-libvirt-x64", "source.qemu.generic-oracle6-libvirt-x64", "source.qemu.generic-oracle7-libvirt-x64", "source.qemu.generic-oracle8-libvirt-x64", "source.qemu.generic-oracle9-libvirt-x64", "source.qemu.generic-rhel6-libvirt-x64", "source.qemu.generic-rhel7-libvirt-x64", "source.qemu.generic-rhel8-libvirt-x64", "source.qemu.generic-rhel9-libvirt-x64", "source.qemu.generic-rocky8-libvirt-x64", "source.qemu.generic-rocky9-libvirt-x64", "source.qemu.generic-ubuntu1604-libvirt-x64", "source.qemu.generic-ubuntu1610-libvirt-x64", "source.qemu.generic-ubuntu1704-libvirt-x64", "source.qemu.generic-ubuntu1710-libvirt-x64", "source.qemu.generic-ubuntu1804-libvirt-x64", "source.qemu.generic-ubuntu1810-libvirt-x64", "source.qemu.generic-ubuntu1904-libvirt-x64", "source.qemu.generic-ubuntu1910-libvirt-x64", "source.qemu.generic-ubuntu2004-libvirt-x64", "source.qemu.generic-ubuntu2010-libvirt-x64", "source.qemu.generic-ubuntu2104-libvirt-x64", "source.qemu.generic-ubuntu2110-libvirt-x64", "source.qemu.generic-ubuntu2204-libvirt-x64", "source.qemu.generic-ubuntu2210-libvirt-x64", "source.qemu.generic-ubuntu2304-libvirt-x64", "source.qemu.generic-ubuntu2310-libvirt-x64"]

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-oracle7-libvirt-x64"]
    scripts             = ["scripts/oracle7/network.sh", "scripts/oracle7/yum.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-oracle7-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/oracle7/kernel.sh", "scripts/oracle7/floppy.sh", "scripts/oracle7/virtualbox.sh", "scripts/oracle7/parallels.sh", "scripts/oracle7/vmware.sh", "scripts/oracle7/qemu.sh", "scripts/oracle7/lvm.sh", "scripts/oracle7/vagrant.sh", "scripts/oracle7/tuning.sh", "scripts/oracle7/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-opensuse42-libvirt-x64"]
    scripts             = ["scripts/opensuse42/zypper.sh", "scripts/opensuse42/virtualbox.sh", "scripts/opensuse42/parallels.sh", "scripts/opensuse42/vmware.sh", "scripts/opensuse42/qemu.sh", "scripts/opensuse42/vagrant.sh", "scripts/opensuse42/network.sh", "scripts/opensuse42/floppy.sh", "scripts/opensuse42/postfix.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/sh '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine35-libvirt-x64"]
    scripts             = ["scripts/alpine35/network.sh", "scripts/alpine35/apk.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine35-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/alpine35/hostname.sh", "scripts/alpine35/lsb.sh", "scripts/alpine35/floppy.sh", "scripts/alpine35/vagrant.sh", "scripts/alpine35/sshd.sh", "scripts/alpine35/virtualbox.sh", "scripts/alpine35/parallels.sh", "scripts/alpine35/vmware.sh", "scripts/alpine35/qemu.sh", "scripts/alpine35/cache.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/sh '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine36-libvirt-x64"]
    scripts             = ["scripts/alpine36/network.sh", "scripts/alpine36/apk.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine36-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/alpine36/hostname.sh", "scripts/alpine36/lsb.sh", "scripts/alpine36/floppy.sh", "scripts/alpine36/vagrant.sh", "scripts/alpine36/sshd.sh", "scripts/alpine36/virtualbox.sh", "scripts/alpine36/parallels.sh", "scripts/alpine36/vmware.sh", "scripts/alpine36/qemu.sh", "scripts/alpine36/cache.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/sh '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine37-libvirt-x64"]
    scripts             = ["scripts/alpine37/network.sh", "scripts/alpine37/apk.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine37-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/alpine37/hostname.sh", "scripts/alpine37/lsb.sh", "scripts/alpine37/floppy.sh", "scripts/alpine37/vagrant.sh", "scripts/alpine37/sshd.sh", "scripts/alpine37/virtualbox.sh", "scripts/alpine37/parallels.sh", "scripts/alpine37/vmware.sh", "scripts/alpine37/qemu.sh", "scripts/alpine37/cache.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/sh '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine38-libvirt-x64"]
    scripts             = ["scripts/alpine38/network.sh", "scripts/alpine38/apk.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine38-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/alpine38/hostname.sh", "scripts/alpine38/lsb.sh", "scripts/alpine38/floppy.sh", "scripts/alpine38/vagrant.sh", "scripts/alpine38/sshd.sh", "scripts/alpine38/virtualbox.sh", "scripts/alpine38/parallels.sh", "scripts/alpine38/vmware.sh", "scripts/alpine38/qemu.sh", "scripts/alpine38/cache.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-centos6-libvirt-x64"]
    scripts             = ["scripts/centos6/yum.sh", "scripts/centos6/base.sh", "scripts/centos6/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-centos6-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/centos6/kernel.sh", "scripts/centos6/vga.sh", "scripts/centos6/virtualbox.sh", "scripts/centos6/parallels.sh", "scripts/centos6/vmware.sh", "scripts/centos6/qemu.sh", "scripts/centos6/vagrant.sh", "scripts/centos6/tuning.sh", "scripts/centos6/sshd.sh", "scripts/centos6/randomness.sh", "scripts/centos6/updatedb.sh", "scripts/centos6/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-centos7-libvirt-x64"]
    scripts             = ["scripts/centos7/network.sh", "scripts/centos7/yum.sh", "scripts/centos7/base.sh", "scripts/centos7/reboot.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-centos7-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/centos7/kernel.sh", "scripts/centos7/floppy.sh", "scripts/centos7/virtualbox.sh", "scripts/centos7/parallels.sh", "scripts/centos7/vmware.sh", "scripts/centos7/qemu.sh", "scripts/centos7/lvm.sh", "scripts/centos7/vagrant.sh", "scripts/centos7/tuning.sh", "scripts/centos7/sshd.sh", "scripts/centos7/randomness.sh", "scripts/centos7/updatedb.sh", "scripts/centos7/cleanup.sh", "scripts/centos7/unyum.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-rhel7-libvirt-x64"]
    scripts             = ["scripts/rhel7/network.sh", "scripts/rhel7/yum.sh", "scripts/rhel7/base.sh", "scripts/rhel7/reboot.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-rhel7-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/rhel7/kernel.sh", "scripts/rhel7/floppy.sh", "scripts/rhel7/virtualbox.sh", "scripts/rhel7/parallels.sh", "scripts/rhel7/vmware.sh", "scripts/rhel7/qemu.sh", "scripts/rhel7/lvm.sh", "scripts/rhel7/vagrant.sh", "scripts/rhel7/tuning.sh", "scripts/rhel7/sshd.sh", "scripts/rhel7/randomness.sh", "scripts/rhel7/updatedb.sh", "scripts/rhel7/cleanup.sh", "scripts/rhel7/unyum.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-gentoo-libvirt-x64"]
    scripts             = ["scripts/gentoo/network.sh", "scripts/gentoo/emerge.sh"]
    start_retry_timeout = "15m"
    timeout             = "12h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-gentoo-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/gentoo/virtualbox.sh", "scripts/gentoo/parallels.sh", "scripts/gentoo/vmware.sh", "scripts/gentoo/qemu.sh", "scripts/gentoo/vagrant.sh"]
    start_retry_timeout = "15m"
    timeout             = "12h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-arch-libvirt-x64"]
    scripts             = ["scripts/arch/pacman.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-arch-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/arch/virtualbox.sh", "scripts/arch/parallels.sh", "scripts/arch/vmware.sh", "scripts/arch/qemu.sh", "scripts/arch/vagrant.sh", "scripts/arch/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-debian8-libvirt-x64"]
    scripts             = ["scripts/debian8/apt.sh", "scripts/debian8/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-debian8-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/debian8/floppy.sh", "scripts/debian8/profile.sh", "scripts/debian8/vagrant.sh", "scripts/debian8/motd.sh", "scripts/debian8/fixtty.sh", "scripts/debian8/virtualbox.sh", "scripts/debian8/parallels.sh", "scripts/debian8/vmware.sh", "scripts/debian8/qemu.sh", "scripts/debian8/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-debian9-libvirt-x64"]
    scripts             = ["scripts/debian9/apt.sh", "scripts/debian9/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-debian9-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/debian9/floppy.sh", "scripts/debian9/profile.sh", "scripts/debian9/vagrant.sh", "scripts/debian9/motd.sh", "scripts/debian9/fixtty.sh", "scripts/debian9/fixuuid.sh", "scripts/debian9/virtualbox.sh", "scripts/debian9/parallels.sh", "scripts/debian9/vmware.sh", "scripts/debian9/qemu.sh", "scripts/debian9/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora25-libvirt-x64"]
    scripts             = ["scripts/fedora25/fixdns.sh", "scripts/fedora25/hostname.sh", "scripts/fedora25/dnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora25-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora25/fixtmp.sh", "scripts/fedora25/base.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora25-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora25/kernel.sh", "scripts/fedora25/vga.sh", "scripts/fedora25/virtualbox.sh", "scripts/fedora25/parallels.sh", "scripts/fedora25/vmware.sh", "scripts/fedora25/qemu.sh", "scripts/fedora25/vagrant.sh", "scripts/fedora25/tuning.sh", "scripts/fedora25/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora26-libvirt-x64"]
    scripts             = ["scripts/fedora26/fixdns.sh", "scripts/fedora26/hostname.sh", "scripts/fedora26/dnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora26-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora26/fixtmp.sh", "scripts/fedora26/base.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora26-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora26/kernel.sh", "scripts/fedora26/vga.sh", "scripts/fedora26/virtualbox.sh", "scripts/fedora26/parallels.sh", "scripts/fedora26/vmware.sh", "scripts/fedora26/qemu.sh", "scripts/fedora26/vagrant.sh", "scripts/fedora26/tuning.sh", "scripts/fedora26/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora27-libvirt-x64"]
    scripts             = ["scripts/fedora27/fixdns.sh", "scripts/fedora27/hostname.sh", "scripts/fedora27/dnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora27-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora27/fixtmp.sh", "scripts/fedora27/base.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora27-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora27/kernel.sh", "scripts/fedora27/vga.sh", "scripts/fedora27/virtualbox.sh", "scripts/fedora27/parallels.sh", "scripts/fedora27/vmware.sh", "scripts/fedora27/qemu.sh", "scripts/fedora27/vagrant.sh", "scripts/fedora27/tuning.sh", "scripts/fedora27/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora28-libvirt-x64"]
    scripts             = ["scripts/fedora28/fixdns.sh", "scripts/fedora28/hostname.sh", "scripts/fedora28/dnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora28-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora28/fixtmp.sh", "scripts/fedora28/base.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora28-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora28/kernel.sh", "scripts/fedora28/vga.sh", "scripts/fedora28/virtualbox.sh", "scripts/fedora28/parallels.sh", "scripts/fedora28/vmware.sh", "scripts/fedora28/qemu.sh", "scripts/fedora28/vagrant.sh", "scripts/fedora28/tuning.sh", "scripts/fedora28/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora29-libvirt-x64"]
    scripts             = ["scripts/fedora29/fixdns.sh", "scripts/fedora29/hostname.sh", "scripts/fedora29/dnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora29-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora29/fixtmp.sh", "scripts/fedora29/base.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora29-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora29/kernel.sh", "scripts/fedora29/vga.sh", "scripts/fedora29/virtualbox.sh", "scripts/fedora29/parallels.sh", "scripts/fedora29/vmware.sh", "scripts/fedora29/qemu.sh", "scripts/fedora29/vagrant.sh", "scripts/fedora29/tuning.sh", "scripts/fedora29/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /usr/local/bin/bash {{ .Path }}"
    expect_disconnect   = "true"
    only                = ["generic-freebsd11-libvirt-x64"]
    scripts             = ["scripts/freebsd11/pkg.sh", "scripts/freebsd11/hostname.sh", "scripts/freebsd11/kernel.sh", "scripts/freebsd11/firstboot.sh", "scripts/freebsd11/motd.sh", "scripts/freebsd11/vagrant.sh", "scripts/freebsd11/virtualbox.sh", "scripts/freebsd11/parallels.sh", "scripts/freebsd11/vmware.sh", "scripts/freebsd11/qemu.sh", "scripts/freebsd11/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/sh {{ .Path }}"
    expect_disconnect   = "true"
    only                = ["generic-openbsd6-libvirt-x64"]
    scripts             = ["scripts/openbsd6/pkg.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /usr/local/bin/bash {{ .Path }}"
    expect_disconnect   = "true"
    only                = ["generic-openbsd6-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/openbsd6/hostname.sh", "scripts/openbsd6/motd.sh", "scripts/openbsd6/vagrant.sh", "scripts/openbsd6/profile.sh", "scripts/openbsd6/virtualbox.sh", "scripts/openbsd6/parallels.sh", "scripts/openbsd6/vmware.sh", "scripts/openbsd6/qemu.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu1604-libvirt-x64"]
    scripts             = ["scripts/ubuntu1604/apt.sh", "scripts/ubuntu1604/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu1604-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/ubuntu1604/floppy.sh", "scripts/ubuntu1604/vagrant.sh", "scripts/ubuntu1604/profile.sh", "scripts/ubuntu1604/motd.sh", "scripts/ubuntu1604/fixtty.sh", "scripts/ubuntu1604/virtualbox.sh", "scripts/ubuntu1604/parallels.sh", "scripts/ubuntu1604/vmware.sh", "scripts/ubuntu1604/qemu.sh", "scripts/ubuntu1604/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu1610-libvirt-x64"]
    scripts             = ["scripts/ubuntu1610/apt.sh", "scripts/ubuntu1610/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu1610-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/ubuntu1610/floppy.sh", "scripts/ubuntu1610/vagrant.sh", "scripts/ubuntu1610/profile.sh", "scripts/ubuntu1610/motd.sh", "scripts/ubuntu1610/fixtty.sh", "scripts/ubuntu1610/virtualbox.sh", "scripts/ubuntu1610/parallels.sh", "scripts/ubuntu1610/vmware.sh", "scripts/ubuntu1610/qemu.sh", "scripts/ubuntu1610/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu1704-libvirt-x64"]
    scripts             = ["scripts/ubuntu1704/apt.sh", "scripts/ubuntu1704/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu1704-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/ubuntu1704/floppy.sh", "scripts/ubuntu1704/vagrant.sh", "scripts/ubuntu1704/profile.sh", "scripts/ubuntu1704/motd.sh", "scripts/ubuntu1704/fixtty.sh", "scripts/ubuntu1704/virtualbox.sh", "scripts/ubuntu1704/parallels.sh", "scripts/ubuntu1704/vmware.sh", "scripts/ubuntu1704/qemu.sh", "scripts/ubuntu1704/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu1710-libvirt-x64"]
    scripts             = ["scripts/ubuntu1710/apt.sh", "scripts/ubuntu1710/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu1710-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/ubuntu1710/floppy.sh", "scripts/ubuntu1710/vagrant.sh", "scripts/ubuntu1710/profile.sh", "scripts/ubuntu1710/motd.sh", "scripts/ubuntu1710/fixtty.sh", "scripts/ubuntu1710/virtualbox.sh", "scripts/ubuntu1710/parallels.sh", "scripts/ubuntu1710/vmware.sh", "scripts/ubuntu1710/qemu.sh", "scripts/ubuntu1710/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu1804-libvirt-x64"]
    scripts             = ["scripts/ubuntu1804/apt.sh", "scripts/ubuntu1804/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu1804-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/ubuntu1804/floppy.sh", "scripts/ubuntu1804/vagrant.sh", "scripts/ubuntu1804/profile.sh", "scripts/ubuntu1804/motd.sh", "scripts/ubuntu1804/fixtty.sh", "scripts/ubuntu1804/virtualbox.sh", "scripts/ubuntu1804/parallels.sh", "scripts/ubuntu1804/vmware.sh", "scripts/ubuntu1804/qemu.sh", "scripts/ubuntu1804/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu1810-libvirt-x64"]
    scripts             = ["scripts/ubuntu1810/apt.sh", "scripts/ubuntu1810/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu1810-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/ubuntu1810/floppy.sh", "scripts/ubuntu1810/vagrant.sh", "scripts/ubuntu1810/profile.sh", "scripts/ubuntu1810/motd.sh", "scripts/ubuntu1810/fixtty.sh", "scripts/ubuntu1810/virtualbox.sh", "scripts/ubuntu1810/parallels.sh", "scripts/ubuntu1810/vmware.sh", "scripts/ubuntu1810/qemu.sh", "scripts/ubuntu1810/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /usr/local/bin/bash {{ .Path }}"
    expect_disconnect   = "true"
    only                = ["generic-freebsd12-libvirt-x64"]
    scripts             = ["scripts/freebsd12/pkg.sh", "scripts/freebsd12/hostname.sh", "scripts/freebsd12/kernel.sh", "scripts/freebsd12/firstboot.sh", "scripts/freebsd12/motd.sh", "scripts/freebsd12/vagrant.sh", "scripts/freebsd12/virtualbox.sh", "scripts/freebsd12/parallels.sh", "scripts/freebsd12/vmware.sh", "scripts/freebsd12/qemu.sh", "scripts/freebsd12/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-rhel6-libvirt-x64"]
    scripts             = ["scripts/rhel6/network.sh", "scripts/rhel6/yum.sh", "scripts/rhel6/base.sh", "scripts/rhel6/reboot.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-rhel6-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/rhel6/kernel.sh", "scripts/rhel6/vga.sh", "scripts/rhel6/virtualbox.sh", "scripts/rhel6/parallels.sh", "scripts/rhel6/vmware.sh", "scripts/rhel6/qemu.sh", "scripts/rhel6/vagrant.sh", "scripts/rhel6/tuning.sh", "scripts/rhel6/sshd.sh", "scripts/rhel6/randomness.sh", "scripts/rhel6/updatedb.sh", "scripts/rhel6/cleanup.sh", "scripts/rhel6/unyum.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-rhel8-libvirt-x64"]
    scripts             = ["scripts/rhel8/network.sh", "scripts/rhel8/dnf.sh", "scripts/rhel8/base.sh", "scripts/rhel8/reboot.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-rhel8-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/rhel8/kernel.sh", "scripts/rhel8/floppy.sh", "scripts/rhel8/virtualbox.sh", "scripts/rhel8/parallels.sh", "scripts/rhel8/vmware.sh", "scripts/rhel8/qemu.sh", "scripts/rhel8/vagrant.sh", "scripts/rhel8/tuning.sh", "scripts/rhel8/sshd.sh", "scripts/rhel8/randomness.sh", "scripts/rhel8/updatedb.sh", "scripts/rhel8/cleanup.sh", "scripts/rhel8/undnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /usr/local/bin/bash {{ .Path }}"
    expect_disconnect   = "true"
    only                = ["generic-hardenedbsd11-libvirt-x64"]
    scripts             = ["scripts/hardenedbsd11/pkg.sh", "scripts/hardenedbsd11/hostname.sh", "scripts/hardenedbsd11/kernel.sh", "scripts/hardenedbsd11/firstboot.sh", "scripts/hardenedbsd11/motd.sh", "scripts/hardenedbsd11/vagrant.sh", "scripts/hardenedbsd11/virtualbox.sh", "scripts/hardenedbsd11/parallels.sh", "scripts/hardenedbsd11/vmware.sh", "scripts/hardenedbsd11/qemu.sh", "scripts/hardenedbsd11/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /usr/local/bin/bash {{ .Path }}"
    expect_disconnect   = "true"
    only                = ["generic-dragonflybsd5-libvirt-x64"]
    scripts             = ["scripts/dragonflybsd5/pkg.sh", "scripts/dragonflybsd5/hostname.sh", "scripts/dragonflybsd5/kernel.sh", "scripts/dragonflybsd5/firstboot.sh", "scripts/dragonflybsd5/motd.sh", "scripts/dragonflybsd5/vagrant.sh", "scripts/dragonflybsd5/virtualbox.sh", "scripts/dragonflybsd5/parallels.sh", "scripts/dragonflybsd5/vmware.sh", "scripts/dragonflybsd5/qemu.sh", "scripts/dragonflybsd5/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/sh {{ .Path }}"
    expect_disconnect   = "true"
    only                = ["generic-netbsd8-libvirt-x64"]
    scripts             = ["scripts/netbsd8/pkg.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} bash {{ .Path }}"
    expect_disconnect   = "true"
    only                = ["generic-netbsd8-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/netbsd8/hostname.sh", "scripts/netbsd8/motd.sh", "scripts/netbsd8/vagrant.sh", "scripts/netbsd8/profile.sh", "scripts/netbsd8/virtualbox.sh", "scripts/netbsd8/parallels.sh", "scripts/netbsd8/vmware.sh", "scripts/netbsd8/qemu.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /usr/local/bin/bash {{ .Path }}"
    expect_disconnect   = "true"
    only                = ["generic-hardenedbsd12-libvirt-x64"]
    scripts             = ["scripts/hardenedbsd12/pkg.sh", "scripts/hardenedbsd12/hostname.sh", "scripts/hardenedbsd12/kernel.sh", "scripts/hardenedbsd12/firstboot.sh", "scripts/hardenedbsd12/motd.sh", "scripts/hardenedbsd12/vagrant.sh", "scripts/hardenedbsd12/virtualbox.sh", "scripts/hardenedbsd12/parallels.sh", "scripts/hardenedbsd12/vmware.sh", "scripts/hardenedbsd12/qemu.sh", "scripts/hardenedbsd12/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/sh '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine39-libvirt-x64"]
    scripts             = ["scripts/alpine39/network.sh", "scripts/alpine39/apk.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine39-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/alpine39/hostname.sh", "scripts/alpine39/lsb.sh", "scripts/alpine39/floppy.sh", "scripts/alpine39/vagrant.sh", "scripts/alpine39/sshd.sh", "scripts/alpine39/virtualbox.sh", "scripts/alpine39/parallels.sh", "scripts/alpine39/vmware.sh", "scripts/alpine39/qemu.sh", "scripts/alpine39/cache.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-debian10-libvirt-x64"]
    scripts             = ["scripts/debian10/apt.sh", "scripts/debian10/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-debian10-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/debian10/floppy.sh", "scripts/debian10/profile.sh", "scripts/debian10/vagrant.sh", "scripts/debian10/motd.sh", "scripts/debian10/fixtty.sh", "scripts/debian10/virtualbox.sh", "scripts/debian10/parallels.sh", "scripts/debian10/vmware.sh", "scripts/debian10/qemu.sh", "scripts/debian10/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu1904-libvirt-x64"]
    scripts             = ["scripts/ubuntu1904/apt.sh", "scripts/ubuntu1904/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu1904-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/ubuntu1904/floppy.sh", "scripts/ubuntu1904/vagrant.sh", "scripts/ubuntu1904/profile.sh", "scripts/ubuntu1904/motd.sh", "scripts/ubuntu1904/fixtty.sh", "scripts/ubuntu1904/virtualbox.sh", "scripts/ubuntu1904/parallels.sh", "scripts/ubuntu1904/vmware.sh", "scripts/ubuntu1904/qemu.sh", "scripts/ubuntu1904/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora30-libvirt-x64"]
    scripts             = ["scripts/fedora30/fixdns.sh", "scripts/fedora30/hostname.sh", "scripts/fedora30/dnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora30-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora30/fixtmp.sh", "scripts/fedora30/base.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora30-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora30/kernel.sh", "scripts/fedora30/updatedb.sh", "scripts/fedora30/vga.sh", "scripts/fedora30/virtualbox.sh", "scripts/fedora30/parallels.sh", "scripts/fedora30/vmware.sh", "scripts/fedora30/qemu.sh", "scripts/fedora30/vagrant.sh", "scripts/fedora30/tuning.sh", "scripts/fedora30/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-oracle8-libvirt-x64"]
    scripts             = ["scripts/oracle8/network.sh", "scripts/oracle8/dnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-oracle8-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/oracle8/kernel.sh", "scripts/oracle8/floppy.sh", "scripts/oracle8/virtualbox.sh", "scripts/oracle8/parallels.sh", "scripts/oracle8/vmware.sh", "scripts/oracle8/qemu.sh", "scripts/oracle8/lvm.sh", "scripts/oracle8/vagrant.sh", "scripts/oracle8/tuning.sh", "scripts/oracle8/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/sh '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine310-libvirt-x64"]
    scripts             = ["scripts/alpine310/network.sh", "scripts/alpine310/apk.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine310-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/alpine310/hostname.sh", "scripts/alpine310/lsb.sh", "scripts/alpine310/floppy.sh", "scripts/alpine310/vagrant.sh", "scripts/alpine310/sshd.sh", "scripts/alpine310/virtualbox.sh", "scripts/alpine310/parallels.sh", "scripts/alpine310/vmware.sh", "scripts/alpine310/qemu.sh", "scripts/alpine310/cache.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-opensuse15-libvirt-x64"]
    scripts             = ["scripts/opensuse15/zypper.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-opensuse15-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/opensuse15/virtualbox.sh", "scripts/opensuse15/parallels.sh", "scripts/opensuse15/vmware.sh", "scripts/opensuse15/qemu.sh", "scripts/opensuse15/vagrant.sh", "scripts/opensuse15/network.sh", "scripts/opensuse15/floppy.sh", "scripts/opensuse15/postfix.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-centos8-libvirt-x64"]
    scripts             = ["scripts/centos8/network.sh", "scripts/centos8/dnf.sh", "scripts/centos8/base.sh", "scripts/centos8/reboot.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-centos8-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/centos8/kernel.sh", "scripts/centos8/floppy.sh", "scripts/centos8/virtualbox.sh", "scripts/centos8/parallels.sh", "scripts/centos8/vmware.sh", "scripts/centos8/qemu.sh", "scripts/centos8/lvm.sh", "scripts/centos8/vagrant.sh", "scripts/centos8/tuning.sh", "scripts/centos8/sshd.sh", "scripts/centos8/randomness.sh", "scripts/centos8/updatedb.sh", "scripts/centos8/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora31-libvirt-x64"]
    scripts             = ["scripts/fedora31/fixdns.sh", "scripts/fedora31/hostname.sh", "scripts/fedora31/dnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora31-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora31/fixtmp.sh", "scripts/fedora31/base.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora31-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora31/kernel.sh", "scripts/fedora31/updatedb.sh", "scripts/fedora31/vga.sh", "scripts/fedora31/virtualbox.sh", "scripts/fedora31/parallels.sh", "scripts/fedora31/vmware.sh", "scripts/fedora31/qemu.sh", "scripts/fedora31/vagrant.sh", "scripts/fedora31/tuning.sh", "scripts/fedora31/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu1910-libvirt-x64"]
    scripts             = ["scripts/ubuntu1910/apt.sh", "scripts/ubuntu1910/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu1910-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/ubuntu1910/floppy.sh", "scripts/ubuntu1910/vagrant.sh", "scripts/ubuntu1910/profile.sh", "scripts/ubuntu1910/motd.sh", "scripts/ubuntu1910/fixtty.sh", "scripts/ubuntu1910/virtualbox.sh", "scripts/ubuntu1910/parallels.sh", "scripts/ubuntu1910/vmware.sh", "scripts/ubuntu1910/qemu.sh", "scripts/ubuntu1910/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "/bin/sh '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine311-libvirt-x64"]
    scripts             = ["scripts/alpine311/network.sh", "scripts/alpine311/apk.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine311-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/alpine311/hostname.sh", "scripts/alpine311/lsb.sh", "scripts/alpine311/floppy.sh", "scripts/alpine311/vagrant.sh", "scripts/alpine311/sshd.sh", "scripts/alpine311/virtualbox.sh", "scripts/alpine311/parallels.sh", "scripts/alpine311/vmware.sh", "scripts/alpine311/qemu.sh", "scripts/alpine311/cache.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu2004-libvirt-x64"]
    scripts             = ["scripts/ubuntu2004/apt.sh", "scripts/ubuntu2004/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu2004-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/ubuntu2004/floppy.sh", "scripts/ubuntu2004/vagrant.sh", "scripts/ubuntu2004/profile.sh", "scripts/ubuntu2004/motd.sh", "scripts/ubuntu2004/fixtty.sh", "scripts/ubuntu2004/virtualbox.sh", "scripts/ubuntu2004/parallels.sh", "scripts/ubuntu2004/vmware.sh", "scripts/ubuntu2004/qemu.sh", "scripts/ubuntu2004/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora32-libvirt-x64"]
    scripts             = ["scripts/fedora32/fixdns.sh", "scripts/fedora32/hostname.sh", "scripts/fedora32/dnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora32-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora32/fixtmp.sh", "scripts/fedora32/base.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora32-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora32/kernel.sh", "scripts/fedora32/updatedb.sh", "scripts/fedora32/vga.sh", "scripts/fedora32/virtualbox.sh", "scripts/fedora32/parallels.sh", "scripts/fedora32/vmware.sh", "scripts/fedora32/qemu.sh", "scripts/fedora32/vagrant.sh", "scripts/fedora32/tuning.sh", "scripts/fedora32/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/sh {{ .Path }}"
    expect_disconnect   = "true"
    only                = ["generic-netbsd9-libvirt-x64"]
    scripts             = ["scripts/netbsd9/pkg.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} bash {{ .Path }}"
    expect_disconnect   = "true"
    only                = ["generic-netbsd9-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/netbsd9/hostname.sh", "scripts/netbsd9/motd.sh", "scripts/netbsd9/vagrant.sh", "scripts/netbsd9/profile.sh", "scripts/netbsd9/virtualbox.sh", "scripts/netbsd9/parallels.sh", "scripts/netbsd9/vmware.sh", "scripts/netbsd9/qemu.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "/bin/sh '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine312-libvirt-x64"]
    scripts             = ["scripts/alpine312/network.sh", "scripts/alpine312/apk.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine312-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/alpine312/hostname.sh", "scripts/alpine312/lsb.sh", "scripts/alpine312/floppy.sh", "scripts/alpine312/vagrant.sh", "scripts/alpine312/sshd.sh", "scripts/alpine312/virtualbox.sh", "scripts/alpine312/parallels.sh", "scripts/alpine312/vmware.sh", "scripts/alpine312/qemu.sh", "scripts/alpine312/cache.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-devuan1-libvirt-x64"]
    scripts             = ["scripts/devuan1/apt.sh", "scripts/devuan1/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-devuan1-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/devuan1/floppy.sh", "scripts/devuan1/vagrant.sh", "scripts/devuan1/motd.sh", "scripts/devuan1/virtualbox.sh", "scripts/devuan1/parallels.sh", "scripts/devuan1/vmware.sh", "scripts/devuan1/qemu.sh", "scripts/devuan1/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-devuan2-libvirt-x64"]
    scripts             = ["scripts/devuan2/apt.sh", "scripts/devuan2/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-devuan2-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/devuan2/floppy.sh", "scripts/devuan2/vagrant.sh", "scripts/devuan2/motd.sh", "scripts/devuan2/virtualbox.sh", "scripts/devuan2/parallels.sh", "scripts/devuan2/vmware.sh", "scripts/devuan2/qemu.sh", "scripts/devuan2/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-devuan3-libvirt-x64"]
    scripts             = ["scripts/devuan3/apt.sh", "scripts/devuan3/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-devuan3-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/devuan3/floppy.sh", "scripts/devuan3/vagrant.sh", "scripts/devuan3/motd.sh", "scripts/devuan3/virtualbox.sh", "scripts/devuan3/parallels.sh", "scripts/devuan3/vmware.sh", "scripts/devuan3/qemu.sh", "scripts/devuan3/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu2010-libvirt-x64"]
    scripts             = ["scripts/ubuntu2010/apt.sh", "scripts/ubuntu2010/floppy.sh", "scripts/ubuntu2010/fixkvp.sh", "scripts/ubuntu2010/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu2010-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/ubuntu2010/vagrant.sh", "scripts/ubuntu2010/profile.sh", "scripts/ubuntu2010/motd.sh", "scripts/ubuntu2010/fixtty.sh", "scripts/ubuntu2010/virtualbox.sh", "scripts/ubuntu2010/parallels.sh", "scripts/ubuntu2010/vmware.sh", "scripts/ubuntu2010/qemu.sh", "scripts/ubuntu2010/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora33-libvirt-x64"]
    scripts             = ["scripts/fedora33/fixdns.sh", "scripts/fedora33/hostname.sh", "scripts/fedora33/dnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora33-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora33/fixtmp.sh", "scripts/fedora33/base.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora33-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora33/kernel.sh", "scripts/fedora33/updatedb.sh", "scripts/fedora33/vga.sh", "scripts/fedora33/virtualbox.sh", "scripts/fedora33/parallels.sh", "scripts/fedora33/vmware.sh", "scripts/fedora33/qemu.sh", "scripts/fedora33/vagrant.sh", "scripts/fedora33/tuning.sh", "scripts/fedora33/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "/bin/sh '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine313-libvirt-x64"]
    scripts             = ["scripts/alpine313/network.sh", "scripts/alpine313/apk.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine313-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/alpine313/hostname.sh", "scripts/alpine313/lsb.sh", "scripts/alpine313/floppy.sh", "scripts/alpine313/vagrant.sh", "scripts/alpine313/sshd.sh", "scripts/alpine313/virtualbox.sh", "scripts/alpine313/parallels.sh", "scripts/alpine313/vmware.sh", "scripts/alpine313/qemu.sh", "scripts/alpine313/cache.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "/bin/sh '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine314-libvirt-x64"]
    scripts             = ["scripts/alpine314/network.sh", "scripts/alpine314/apk.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine314-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/alpine314/hostname.sh", "scripts/alpine314/lsb.sh", "scripts/alpine314/floppy.sh", "scripts/alpine314/vagrant.sh", "scripts/alpine314/sshd.sh", "scripts/alpine314/virtualbox.sh", "scripts/alpine314/parallels.sh", "scripts/alpine314/vmware.sh", "scripts/alpine314/qemu.sh", "scripts/alpine314/cache.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu2104-libvirt-x64"]
    scripts             = ["scripts/ubuntu2104/apt.sh", "scripts/ubuntu2104/floppy.sh", "scripts/ubuntu2104/fixkvp.sh", "scripts/ubuntu2104/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu2104-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/ubuntu2104/vagrant.sh", "scripts/ubuntu2104/profile.sh", "scripts/ubuntu2104/motd.sh", "scripts/ubuntu2104/fixtty.sh", "scripts/ubuntu2104/virtualbox.sh", "scripts/ubuntu2104/parallels.sh", "scripts/ubuntu2104/vmware.sh", "scripts/ubuntu2104/qemu.sh", "scripts/ubuntu2104/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-rocky8-libvirt-x64"]
    scripts             = ["scripts/rocky8/network.sh", "scripts/rocky8/dnf.sh", "scripts/rocky8/base.sh", "scripts/rocky8/reboot.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-rocky8-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/rocky8/kernel.sh", "scripts/rocky8/floppy.sh", "scripts/rocky8/virtualbox.sh", "scripts/rocky8/parallels.sh", "scripts/rocky8/vmware.sh", "scripts/rocky8/qemu.sh", "scripts/rocky8/lvm.sh", "scripts/rocky8/vagrant.sh", "scripts/rocky8/tuning.sh", "scripts/rocky8/sshd.sh", "scripts/rocky8/randomness.sh", "scripts/rocky8/updatedb.sh", "scripts/rocky8/cleanup.sh", "scripts/rocky8/undnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alma8-libvirt-x64"]
    scripts             = ["scripts/alma8/network.sh", "scripts/alma8/dnf.sh", "scripts/alma8/base.sh", "scripts/alma8/reboot.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alma8-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/alma8/kernel.sh", "scripts/alma8/floppy.sh", "scripts/alma8/virtualbox.sh", "scripts/alma8/parallels.sh", "scripts/alma8/vmware.sh", "scripts/alma8/qemu.sh", "scripts/alma8/lvm.sh", "scripts/alma8/vagrant.sh", "scripts/alma8/tuning.sh", "scripts/alma8/sshd.sh", "scripts/alma8/randomness.sh", "scripts/alma8/updatedb.sh", "scripts/alma8/cleanup.sh", "scripts/alma8/undnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora34-libvirt-x64"]
    scripts             = ["scripts/fedora34/fixdns.sh", "scripts/fedora34/hostname.sh", "scripts/fedora34/dnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora34-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora34/fixtmp.sh", "scripts/fedora34/base.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora34-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora34/kernel.sh", "scripts/fedora34/updatedb.sh", "scripts/fedora34/vga.sh", "scripts/fedora34/virtualbox.sh", "scripts/fedora34/parallels.sh", "scripts/fedora34/vmware.sh", "scripts/fedora34/qemu.sh", "scripts/fedora34/vagrant.sh", "scripts/fedora34/tuning.sh", "scripts/fedora34/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /usr/local/bin/bash {{ .Path }}"
    expect_disconnect   = "true"
    only                = ["generic-freebsd13-libvirt-x64"]
    scripts             = ["scripts/freebsd13/pkg.sh", "scripts/freebsd13/hostname.sh", "scripts/freebsd13/kernel.sh", "scripts/freebsd13/firstboot.sh", "scripts/freebsd13/motd.sh", "scripts/freebsd13/vagrant.sh", "scripts/freebsd13/virtualbox.sh", "scripts/freebsd13/parallels.sh", "scripts/freebsd13/vmware.sh", "scripts/freebsd13/qemu.sh", "scripts/freebsd13/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /usr/local/bin/bash {{ .Path }}"
    expect_disconnect   = "true"
    only                = ["generic-hardenedbsd13-libvirt-x64"]
    scripts             = ["scripts/hardenedbsd13/pkg.sh", "scripts/hardenedbsd13/hostname.sh", "scripts/hardenedbsd13/kernel.sh", "scripts/hardenedbsd13/firstboot.sh", "scripts/hardenedbsd13/motd.sh", "scripts/hardenedbsd13/vagrant.sh", "scripts/hardenedbsd13/virtualbox.sh", "scripts/hardenedbsd13/parallels.sh", "scripts/hardenedbsd13/vmware.sh", "scripts/hardenedbsd13/qemu.sh", "scripts/hardenedbsd13/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /usr/local/bin/bash {{ .Path }}"
    expect_disconnect   = "true"
    only                = ["generic-dragonflybsd6-libvirt-x64"]
    scripts             = ["scripts/dragonflybsd6/pkg.sh", "scripts/dragonflybsd6/hostname.sh", "scripts/dragonflybsd6/kernel.sh", "scripts/dragonflybsd6/firstboot.sh", "scripts/dragonflybsd6/motd.sh", "scripts/dragonflybsd6/vagrant.sh", "scripts/dragonflybsd6/virtualbox.sh", "scripts/dragonflybsd6/parallels.sh", "scripts/dragonflybsd6/vmware.sh", "scripts/dragonflybsd6/qemu.sh", "scripts/dragonflybsd6/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-debian11-libvirt-x64"]
    scripts             = ["scripts/debian11/apt.sh", "scripts/debian11/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-debian11-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/debian11/floppy.sh", "scripts/debian11/profile.sh", "scripts/debian11/vagrant.sh", "scripts/debian11/motd.sh", "scripts/debian11/fixtty.sh", "scripts/debian11/virtualbox.sh", "scripts/debian11/parallels.sh", "scripts/debian11/vmware.sh", "scripts/debian11/qemu.sh", "scripts/debian11/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

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

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu2110-libvirt-x64"]
    scripts             = ["scripts/ubuntu2110/apt.sh", "scripts/ubuntu2110/floppy.sh", "scripts/ubuntu2110/fixkvp.sh", "scripts/ubuntu2110/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu2110-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/ubuntu2110/vagrant.sh", "scripts/ubuntu2110/profile.sh", "scripts/ubuntu2110/motd.sh", "scripts/ubuntu2110/fixtty.sh", "scripts/ubuntu2110/virtualbox.sh", "scripts/ubuntu2110/parallels.sh", "scripts/ubuntu2110/vmware.sh", "scripts/ubuntu2110/qemu.sh", "scripts/ubuntu2110/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "/bin/sh '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine315-libvirt-x64"]
    scripts             = ["scripts/alpine315/network.sh", "scripts/alpine315/apk.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine315-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/alpine315/hostname.sh", "scripts/alpine315/lsb.sh", "scripts/alpine315/floppy.sh", "scripts/alpine315/vagrant.sh", "scripts/alpine315/sshd.sh", "scripts/alpine315/virtualbox.sh", "scripts/alpine315/parallels.sh", "scripts/alpine315/vmware.sh", "scripts/alpine315/qemu.sh", "scripts/alpine315/cache.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora35-libvirt-x64"]
    scripts             = ["scripts/fedora35/fixdns.sh", "scripts/fedora35/hostname.sh", "scripts/fedora35/dnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora35-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora35/fixtmp.sh", "scripts/fedora35/base.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora35-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora35/kernel.sh", "scripts/fedora35/updatedb.sh", "scripts/fedora35/vga.sh", "scripts/fedora35/virtualbox.sh", "scripts/fedora35/parallels.sh", "scripts/fedora35/vmware.sh", "scripts/fedora35/qemu.sh", "scripts/fedora35/vagrant.sh", "scripts/fedora35/tuning.sh", "scripts/fedora35/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-devuan4-libvirt-x64"]
    scripts             = ["scripts/devuan4/apt.sh", "scripts/devuan4/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-devuan4-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/devuan4/floppy.sh", "scripts/devuan4/vagrant.sh", "scripts/devuan4/motd.sh", "scripts/devuan4/virtualbox.sh", "scripts/devuan4/parallels.sh", "scripts/devuan4/vmware.sh", "scripts/devuan4/qemu.sh", "scripts/devuan4/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu2204-libvirt-x64"]
    scripts             = ["scripts/ubuntu2204/apt.sh", "scripts/ubuntu2204/floppy.sh", "scripts/ubuntu2204/fixkvp.sh", "scripts/ubuntu2204/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu2204-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/ubuntu2204/vagrant.sh", "scripts/ubuntu2204/profile.sh", "scripts/ubuntu2204/motd.sh", "scripts/ubuntu2204/fixtty.sh", "scripts/ubuntu2204/virtualbox.sh", "scripts/ubuntu2204/parallels.sh", "scripts/ubuntu2204/vmware.sh", "scripts/ubuntu2204/qemu.sh", "scripts/ubuntu2204/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora36-libvirt-x64"]
    scripts             = ["scripts/fedora36/fixdns.sh", "scripts/fedora36/hostname.sh", "scripts/fedora36/dnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora36-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora36/fixtmp.sh", "scripts/fedora36/base.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora36-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora36/kernel.sh", "scripts/fedora36/updatedb.sh", "scripts/fedora36/vga.sh", "scripts/fedora36/virtualbox.sh", "scripts/fedora36/parallels.sh", "scripts/fedora36/vmware.sh", "scripts/fedora36/qemu.sh", "scripts/fedora36/vagrant.sh", "scripts/fedora36/tuning.sh", "scripts/fedora36/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-rhel9-libvirt-x64"]
    scripts             = ["scripts/rhel9/network.sh", "scripts/rhel9/dnf.sh", "scripts/rhel9/base.sh", "scripts/rhel9/reboot.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-rhel9-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/rhel9/kernel.sh", "scripts/rhel9/floppy.sh", "scripts/rhel9/virtualbox.sh", "scripts/rhel9/parallels.sh", "scripts/rhel9/vmware.sh", "scripts/rhel9/qemu.sh", "scripts/rhel9/vagrant.sh", "scripts/rhel9/tuning.sh", "scripts/rhel9/sshd.sh", "scripts/rhel9/randomness.sh", "scripts/rhel9/updatedb.sh", "scripts/rhel9/cleanup.sh", "scripts/rhel9/undnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-centos8s-libvirt-x64"]
    scripts             = ["scripts/centos8s/network.sh", "scripts/centos8s/dnf.sh", "scripts/centos8s/base.sh", "scripts/centos8s/reboot.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-centos8s-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/centos8s/kernel.sh", "scripts/centos8s/floppy.sh", "scripts/centos8s/virtualbox.sh", "scripts/centos8s/parallels.sh", "scripts/centos8s/vmware.sh", "scripts/centos8s/qemu.sh", "scripts/centos8s/lvm.sh", "scripts/centos8s/vagrant.sh", "scripts/centos8s/tuning.sh", "scripts/centos8s/sshd.sh", "scripts/centos8s/randomness.sh", "scripts/centos8s/updatedb.sh", "scripts/centos8s/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-centos9s-libvirt-x64"]
    scripts             = ["scripts/centos9s/network.sh", "scripts/centos9s/dnf.sh", "scripts/centos9s/base.sh", "scripts/centos9s/reboot.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-centos9s-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/centos9s/kernel.sh", "scripts/centos9s/floppy.sh", "scripts/centos9s/virtualbox.sh", "scripts/centos9s/parallels.sh", "scripts/centos9s/vmware.sh", "scripts/centos9s/qemu.sh", "scripts/centos9s/vagrant.sh", "scripts/centos9s/tuning.sh", "scripts/centos9s/sshd.sh", "scripts/centos9s/randomness.sh", "scripts/centos9s/updatedb.sh", "scripts/centos9s/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "/bin/sh '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine316-libvirt-x64"]
    scripts             = ["scripts/alpine316/network.sh", "scripts/alpine316/apk.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine316-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/alpine316/hostname.sh", "scripts/alpine316/lsb.sh", "scripts/alpine316/floppy.sh", "scripts/alpine316/vagrant.sh", "scripts/alpine316/sshd.sh", "scripts/alpine316/virtualbox.sh", "scripts/alpine316/parallels.sh", "scripts/alpine316/vmware.sh", "scripts/alpine316/qemu.sh", "scripts/alpine316/cache.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alma9-libvirt-x64"]
    scripts             = ["scripts/alma9/network.sh", "scripts/alma9/dnf.sh", "scripts/alma9/base.sh", "scripts/alma9/reboot.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alma9-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/alma9/kernel.sh", "scripts/alma9/floppy.sh", "scripts/alma9/virtualbox.sh", "scripts/alma9/parallels.sh", "scripts/alma9/vmware.sh", "scripts/alma9/qemu.sh", "scripts/alma9/vagrant.sh", "scripts/alma9/tuning.sh", "scripts/alma9/sshd.sh", "scripts/alma9/randomness.sh", "scripts/alma9/updatedb.sh", "scripts/alma9/cleanup.sh", "scripts/alma9/undnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-oracle9-libvirt-x64"]
    scripts             = ["scripts/oracle9/network.sh", "scripts/oracle9/dnf.sh", "scripts/oracle9/base.sh", "scripts/oracle9/reboot.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-oracle9-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/oracle9/kernel.sh", "scripts/oracle9/floppy.sh", "scripts/oracle9/virtualbox.sh", "scripts/oracle9/parallels.sh", "scripts/oracle9/vmware.sh", "scripts/oracle9/qemu.sh", "scripts/oracle9/vagrant.sh", "scripts/oracle9/tuning.sh", "scripts/oracle9/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-rocky9-libvirt-x64"]
    scripts             = ["scripts/rocky9/network.sh", "scripts/rocky9/dnf.sh", "scripts/rocky9/base.sh", "scripts/rocky9/reboot.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-rocky9-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/rocky9/kernel.sh", "scripts/rocky9/floppy.sh", "scripts/rocky9/virtualbox.sh", "scripts/rocky9/parallels.sh", "scripts/rocky9/vmware.sh", "scripts/rocky9/qemu.sh", "scripts/rocky9/vagrant.sh", "scripts/rocky9/tuning.sh", "scripts/rocky9/sshd.sh", "scripts/rocky9/randomness.sh", "scripts/rocky9/updatedb.sh", "scripts/rocky9/cleanup.sh", "scripts/rocky9/undnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-oracle6-libvirt-x64"]
    scripts             = ["scripts/oracle6/yum.sh", "scripts/oracle6/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-oracle6-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/oracle6/kernel.sh", "scripts/oracle6/floppy.sh", "scripts/oracle6/virtualbox.sh", "scripts/oracle6/parallels.sh", "scripts/oracle6/vmware.sh", "scripts/oracle6/qemu.sh", "scripts/oracle6/vagrant.sh", "scripts/oracle6/tuning.sh", "scripts/oracle6/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu2210-libvirt-x64"]
    scripts             = ["scripts/ubuntu2210/apt.sh", "scripts/ubuntu2210/floppy.sh", "scripts/ubuntu2210/fixkvp.sh", "scripts/ubuntu2210/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu2210-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/ubuntu2210/vagrant.sh", "scripts/ubuntu2210/profile.sh", "scripts/ubuntu2210/motd.sh", "scripts/ubuntu2210/fixtty.sh", "scripts/ubuntu2210/virtualbox.sh", "scripts/ubuntu2210/parallels.sh", "scripts/ubuntu2210/vmware.sh", "scripts/ubuntu2210/qemu.sh", "scripts/ubuntu2210/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora37-libvirt-x64"]
    scripts             = ["scripts/fedora37/fixdns.sh", "scripts/fedora37/hostname.sh", "scripts/fedora37/dnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora37-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora37/fixtmp.sh", "scripts/fedora37/base.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora37-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora37/kernel.sh", "scripts/fedora37/updatedb.sh", "scripts/fedora37/vga.sh", "scripts/fedora37/virtualbox.sh", "scripts/fedora37/parallels.sh", "scripts/fedora37/vmware.sh", "scripts/fedora37/qemu.sh", "scripts/fedora37/vagrant.sh", "scripts/fedora37/tuning.sh", "scripts/fedora37/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora38-libvirt-x64"]
    scripts             = ["scripts/fedora38/fixdns.sh", "scripts/fedora38/hostname.sh", "scripts/fedora38/dnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora38-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora38/fixtmp.sh", "scripts/fedora38/base.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora38-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora38/kernel.sh", "scripts/fedora38/updatedb.sh", "scripts/fedora38/vga.sh", "scripts/fedora38/virtualbox.sh", "scripts/fedora38/parallels.sh", "scripts/fedora38/vmware.sh", "scripts/fedora38/qemu.sh", "scripts/fedora38/vagrant.sh", "scripts/fedora38/tuning.sh", "scripts/fedora38/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "/bin/sh '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine317-libvirt-x64"]
    scripts             = ["scripts/alpine317/network.sh", "scripts/alpine317/apk.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine317-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/alpine317/hostname.sh", "scripts/alpine317/lsb.sh", "scripts/alpine317/floppy.sh", "scripts/alpine317/vagrant.sh", "scripts/alpine317/sshd.sh", "scripts/alpine317/virtualbox.sh", "scripts/alpine317/parallels.sh", "scripts/alpine317/vmware.sh", "scripts/alpine317/qemu.sh", "scripts/alpine317/cache.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu2304-libvirt-x64"]
    scripts             = ["scripts/ubuntu2304/apt.sh", "scripts/ubuntu2304/floppy.sh", "scripts/ubuntu2304/fixkvp.sh", "scripts/ubuntu2304/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu2304-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/ubuntu2304/vagrant.sh", "scripts/ubuntu2304/profile.sh", "scripts/ubuntu2304/motd.sh", "scripts/ubuntu2304/fixtty.sh", "scripts/ubuntu2304/virtualbox.sh", "scripts/ubuntu2304/parallels.sh", "scripts/ubuntu2304/vmware.sh", "scripts/ubuntu2304/qemu.sh", "scripts/ubuntu2304/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-debian12-libvirt-x64"]
    scripts             = ["scripts/debian12/apt.sh", "scripts/debian12/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-debian12-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/debian12/floppy.sh", "scripts/debian12/profile.sh", "scripts/debian12/vagrant.sh", "scripts/debian12/motd.sh", "scripts/debian12/fixtty.sh", "scripts/debian12/virtualbox.sh", "scripts/debian12/parallels.sh", "scripts/debian12/vmware.sh", "scripts/debian12/qemu.sh", "scripts/debian12/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "/bin/sh '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine318-libvirt-x64"]
    scripts             = ["scripts/alpine318/network.sh", "scripts/alpine318/apk.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine318-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/alpine318/hostname.sh", "scripts/alpine318/lsb.sh", "scripts/alpine318/floppy.sh", "scripts/alpine318/vagrant.sh", "scripts/alpine318/sshd.sh", "scripts/alpine318/virtualbox.sh", "scripts/alpine318/parallels.sh", "scripts/alpine318/vmware.sh", "scripts/alpine318/qemu.sh", "scripts/alpine318/cache.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-devuan5-libvirt-x64"]
    scripts             = ["scripts/devuan5/apt.sh", "scripts/devuan5/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-devuan5-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/devuan5/floppy.sh", "scripts/devuan5/vagrant.sh", "scripts/devuan5/motd.sh", "scripts/devuan5/virtualbox.sh", "scripts/devuan5/parallels.sh", "scripts/devuan5/vmware.sh", "scripts/devuan5/qemu.sh", "scripts/devuan5/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /usr/local/bin/bash {{ .Path }}"
    expect_disconnect   = "true"
    only                = ["generic-hardenedbsd-libvirt-x64"]
    scripts             = ["scripts/hardenedbsd/pkg.sh", "scripts/hardenedbsd/hostname.sh", "scripts/hardenedbsd/kernel.sh", "scripts/hardenedbsd/firstboot.sh", "scripts/hardenedbsd/motd.sh", "scripts/hardenedbsd/vagrant.sh", "scripts/hardenedbsd/virtualbox.sh", "scripts/hardenedbsd/parallels.sh", "scripts/hardenedbsd/vmware.sh", "scripts/hardenedbsd/qemu.sh", "scripts/hardenedbsd/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /usr/local/bin/bash {{ .Path }}"
    expect_disconnect   = "true"
    only                = ["generic-dragonflybsd-libvirt-x64"]
    scripts             = ["scripts/dragonflybsd/pkg.sh", "scripts/dragonflybsd/hostname.sh", "scripts/dragonflybsd/kernel.sh", "scripts/dragonflybsd/firstboot.sh", "scripts/dragonflybsd/motd.sh", "scripts/dragonflybsd/vagrant.sh", "scripts/dragonflybsd/virtualbox.sh", "scripts/dragonflybsd/parallels.sh", "scripts/dragonflybsd/vmware.sh", "scripts/dragonflybsd/qemu.sh", "scripts/dragonflybsd/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu2310-libvirt-x64"]
    scripts             = ["scripts/ubuntu2310/apt.sh", "scripts/ubuntu2310/floppy.sh", "scripts/ubuntu2310/fixkvp.sh", "scripts/ubuntu2310/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-ubuntu2310-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/ubuntu2310/vagrant.sh", "scripts/ubuntu2310/profile.sh", "scripts/ubuntu2310/motd.sh", "scripts/ubuntu2310/fixtty.sh", "scripts/ubuntu2310/virtualbox.sh", "scripts/ubuntu2310/parallels.sh", "scripts/ubuntu2310/vmware.sh", "scripts/ubuntu2310/qemu.sh", "scripts/ubuntu2310/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /usr/local/bin/bash {{ .Path }}"
    expect_disconnect   = "true"
    only                = ["generic-freebsd14-libvirt-x64"]
    scripts             = ["scripts/freebsd14/pkg.sh", "scripts/freebsd14/hostname.sh", "scripts/freebsd14/kernel.sh", "scripts/freebsd14/firstboot.sh", "scripts/freebsd14/motd.sh", "scripts/freebsd14/vagrant.sh", "scripts/freebsd14/virtualbox.sh", "scripts/freebsd14/parallels.sh", "scripts/freebsd14/vmware.sh", "scripts/freebsd14/qemu.sh", "scripts/freebsd14/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora39-libvirt-x64"]
    scripts             = ["scripts/fedora39/fixdns.sh", "scripts/fedora39/hostname.sh", "scripts/fedora39/dnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora39-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora39/fixtmp.sh", "scripts/fedora39/base.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora39-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/fedora39/kernel.sh", "scripts/fedora39/updatedb.sh", "scripts/fedora39/vga.sh", "scripts/fedora39/virtualbox.sh", "scripts/fedora39/parallels.sh", "scripts/fedora39/vmware.sh", "scripts/fedora39/qemu.sh", "scripts/fedora39/vagrant.sh", "scripts/fedora39/tuning.sh", "scripts/fedora39/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "/bin/sh '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine319-libvirt-x64"]
    scripts             = ["scripts/alpine319/network.sh", "scripts/alpine319/apk.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["generic-alpine319-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/alpine319/hostname.sh", "scripts/alpine319/lsb.sh", "scripts/alpine319/floppy.sh", "scripts/alpine319/vagrant.sh", "scripts/alpine319/sshd.sh", "scripts/alpine319/virtualbox.sh", "scripts/alpine319/parallels.sh", "scripts/alpine319/vmware.sh", "scripts/alpine319/qemu.sh", "scripts/alpine319/cache.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora-rawhide-libvirt-x64"]
    scripts             = ["scripts/rawhide/fixdns.sh", "scripts/rawhide/hostname.sh", "scripts/rawhide/dnf.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora-rawhide-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/rawhide/fixtmp.sh", "scripts/rawhide/base.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["generic-fedora-rawhide-libvirt-x64"]
    pause_before        = "2m0s"
    scripts             = ["scripts/rawhide/kernel.sh", "scripts/rawhide/updatedb.sh", "scripts/rawhide/vga.sh", "scripts/rawhide/virtualbox.sh", "scripts/rawhide/parallels.sh", "scripts/rawhide/vmware.sh", "scripts/rawhide/qemu.sh", "scripts/rawhide/vagrant.sh", "scripts/rawhide/tuning.sh", "scripts/rawhide/cleanup.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    scripts             = ["scripts/common/motd.sh", "scripts/common/keys.sh", "scripts/common/machine.sh", "scripts/common/leases.sh", "scripts/common/localtime.sh", "scripts/common/zerodisk.sh", "scripts/common/lockout.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }


  # could not parse template for following block: "template: hcl2_upgrade:7: unexpected \"\\\\\" in operand"
  post-processors {
    post-processor "vagrant" {
      keep_input_artifact  = false
      compression_level    = 9
      except               = ["generic-fedora-rawhide-libvirt-x64"]
      include              = ["tpl/generic/info.json"]
      output               = "output/generic-{{split build_name \"-\" 1}}-{{split build_name \"-\" 2}}-{{split build_name \"-\" 3}}-{{user `box_version`}}.box"
      vagrantfile_template = "tpl/generic-{{split build_name \"-\" 1}}.rb"
    }
    post-processor "checksum" {
      keep_input_artifact = false
      checksum_types      = ["sha256"]
      except              = ["generic-fedora-rawhide-libvirt-x64"]
      output              = "output/generic-{{split build_name \"-\" 1}}-{{split build_name \"-\" 2}}-{{split build_name \"-\" 3}}-{{user `box_version`}}.box.sha256"
    }
  }

  # could not parse template for following block: "template: hcl2_upgrade:7: unexpected \"\\\\\" in operand"
  post-processors {
    post-processor "vagrant" {
      keep_input_artifact  = false
      compression_level    = 9
      except               = ["generic-fedora-rawhide-libvirt-x64"]
      include              = ["tpl/roboxes/info.json"]
      output               = "output/roboxes-{{split build_name \"-\" 1}}-{{split build_name \"-\" 2}}-{{split build_name \"-\" 3}}-{{user `box_version`}}.box"
      vagrantfile_template = "tpl/roboxes-{{split build_name \"-\" 1}}.rb"
    }
    post-processor "checksum" {
      keep_input_artifact = false
      checksum_types      = ["sha256"]
      except              = ["generic-fedora-rawhide-libvirt-x64"]
      output              = "output/roboxes-{{split build_name \"-\" 1}}-{{split build_name \"-\" 2}}-{{split build_name \"-\" 3}}-{{user `box_version`}}.box.sha256"
    }
  }

  # could not parse template for following block: "template: hcl2_upgrade:7: unexpected \"\\\\\" in operand"
  post-processors {
    post-processor "vagrant" {
      keep_input_artifact  = false
      compression_level    = 9
      include              = ["tpl/generic/info.json"]
      only                 = ["generic-fedora-rawhide-libvirt-x64"]
      output               = "output/generic-{{split build_name \"-\" 1}}-{{split build_name \"-\" 2}}-{{split build_name \"-\" 3}}-{{split build_name \"-\" 4}}-{{user `box_version`}}.box"
      vagrantfile_template = "tpl/generic-{{split build_name \"-\" 1}}-{{split build_name \"-\" 2}}.rb"
    }
    post-processor "checksum" {
      keep_input_artifact = false
      checksum_types      = ["sha256"]
      only                = ["generic-fedora-rawhide-libvirt-x64"]
      output              = "output/generic-{{split build_name \"-\" 1}}-{{split build_name \"-\" 2}}-{{split build_name \"-\" 3}}-{{split build_name \"-\" 4}}-{{user `box_version`}}.box.sha256"
    }
  }

  # could not parse template for following block: "template: hcl2_upgrade:7: unexpected \"\\\\\" in operand"
  post-processors {
    post-processor "vagrant" {
      keep_input_artifact  = false
      compression_level    = 9
      include              = ["tpl/roboxes/info.json"]
      only                 = ["generic-fedora-rawhide-libvirt-x64"]
      output               = "output/roboxes-{{split build_name \"-\" 1}}-{{split build_name \"-\" 2}}-{{split build_name \"-\" 3}}-{{split build_name \"-\" 4}}-{{user `box_version`}}.box"
      vagrantfile_template = "tpl/roboxes-{{split build_name \"-\" 1}}-{{split build_name \"-\" 2}}.rb"
    }
    post-processor "checksum" {
      keep_input_artifact = false
      checksum_types      = ["sha256"]
      only                = ["generic-fedora-rawhide-libvirt-x64"]
      output              = "output/roboxes-{{split build_name \"-\" 1}}-{{split build_name \"-\" 2}}-{{split build_name \"-\" 3}}-{{split build_name \"-\" 4}}-{{user `box_version`}}.box.sha256"
    }
  }
}
