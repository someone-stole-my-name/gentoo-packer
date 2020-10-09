#!/bin/bash

CHROOT_DIR=/mnt/gentoo

tail \
    -F ${CHROOT_DIR}/makelog \
    -F ${CHROOT_DIR}/var/log/emerge-fetch.log \
    -F ${CHROOT_DIR}/var/log/emerge.log &

chroot ${CHROOT_DIR} /bin/bash <<EOF
source /etc/profile
pyvenv /root/ansible_env
source /root/ansible_env/bin/activate
pip install ansible

emerge-webrsync
emerge -1 app-portage/gentoolkit

ansible-playbook -i localhost /root/ansible/playbook.yml --tags chroot
EOF

pkill tail
