# -*- mode: ruby -*-

$script = <<-'SCRIPT'
set -o errexit
set -o nounset

# Step -- 1.
sudo dnf install --assumeyes git git-core python3 python3-devel

# Step -- 2.
git clone --depth=1 --branch=master https://github.com/vladpunko/workstation.git

# Step -- 3.
cd ./workstation/

# Step -- 4.
python3 -m pip install --user --requirement=requirements.txt

# Step -- 5.
ansible-playbook --ask-become-pass --inventory=hosts workstation.yml

# Step -- 6.
cd && rm --force --recursive ./workstation/

# Done!
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.define "devbox" do |devbox_config|
    devbox_config.vm.box = "fedora/34-cloud-base"
    devbox_config.vm.hostname = "devbox"
    devbox_config.vm.network "forwarded_port", guest: 22, host: 2200
    devbox_config.vm.box_check_update = false

    # Resize the main system disk.
    devbox_config.disksize.size = "50GB"  # vagrant plugin install vagrant-disksize

    devbox_config.vm.provider "virtualbox" do |vb|
      vb.name = "devbox"
      vb.cpus = 2
      vb.memory = 4096  # ~ 4GB
    end

    devbox_config.vm.provision "shell", inline: $script, privileged: false
  end
end
