# -*- mode: ruby -*-
# vi: set ft=ruby :

#########################
$CPU = 4
$MEMORY = 4096
$VRAM = 256
$CPUEXECUTIONCAP = 100 # does not work with hyper-v
$BASEOS = "ubuntu/focal64"
#########################

Vagrant.configure("2") do |config|
  config.vm.box = $BASEOS

  config.vm.provider "virtualbox" do |v|
    v.memory = $MEMORY
    v.cpus = $CPU
    v.customize ["modifyvm", :id, "--cpuexecutioncap", $CPUEXECUTIONCAP]
    v.customize ["modifyvm", :id, "--vram", $VRAM]
    v.customize ["modifyvm", :id, "--accelerate3d", "on"]
  end

  config.vm.provider "hyperv" do |v|
    v.memory = $MEMORY
    v.cpus = $CPU
  end
  
  config.vm.provider "libvirt" do |v|
    v.memory = $MEMORY
    v.cpus = $CPU
  end
  
  config.vm.synced_folder ".", "/vagrant"

  config.vm.provision "ansible", type: "shell" do |s|
    s.inline = "apt-get update && apt-get install -y python3 python3-pip && pip3 install ansible ansible-base"
  end

  config.vm.provision  "playbook", type: "ansible_local" do |ansible|
    # ansible.install_mode = "pip"
    ansible.install = false
    ansible.galaxy_role_file = "/vagrant/requirements.yml"
    ansible.playbook = "/vagrant/playbook.yml"
  end

  # config.vm.provision "theme", type: "ansible_local" do |ansible|
  #   ansible.install_mode = "pip"
  #   ansible.playbook = "/vagrant/theme.yml"
  # end

  # config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  # config.vm.provision "fix-no-tty", type: "shell" do |s|
  #   s.privileged = false
  #   s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
  # end
  
  # config.vm.provision "ubuntu-desktop", type: "shell" do |s|
  #   s.privileged = true
  #   s.path = "install.sh"
  # end

  # config.vm.provision "ansible_local" do |ansible|
  #   ansible.galaxy_role_file = "/vagrant/requirements.yml"
  #   ansible.playbook = "/vagrant/playbook2.yml"
  # end
end
