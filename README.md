# Gentoo - Virtualbox Vagrant Box

This is a minimal stage3 installation of Gentoo.

**Note:** The portage tree is not present in the image, to download it run `emerge-webrsync` on first run.

## Usage

Install the latest version of Packer and Ansible >= 2.7 and then run:

    ./build.sh

## What's installed?

The default world set includes:
 
    sys-kernel/gentoo-sources
    sys-boot/grub:2
    app-admin/sudo

## What's configured?

Nothing

#### See: https://app.vagrantup.com/chn2guevara/boxes/gentoo
