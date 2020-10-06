# Drone test
Vagrant.configure("2") do |config|
    config.vm.box = "./gentoo-amd64-stage3_virtualbox.box"
    config.vm.synced_folder '.', '/vagrant', disabled: true
    config.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "256"
      vb.check_guest_additions = false
      vb.functional_vboxsf     = false
    end
  end
