Vagrant.configure("2") do |config|
  config.vm.provision "puppet"

  config.vm.define "debian" do |debian|
    debian.vm.box = "puppetlabs/debian-8.2-64-puppet"
  end

  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"
  end

  config.vm.define "centos" do |centos|
    centos.vm.box = "puppetlabs/centos-7.2-64-puppet"
  end
end
