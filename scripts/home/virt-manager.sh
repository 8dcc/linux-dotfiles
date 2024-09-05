#!/bin/bash

systemctl start libvirtd
systemctl start libvirt-guests
systemctl start virtlogd
chown username:username /var/run/libvirt/libvirt-sock

echo "If default network doesn't start, run:"
echo "  # virsh net-autostart default"
echo "  # virsh net-start default"
echo "In case of more problems, check:"
echo "  $ systemctl status libvirtd"
