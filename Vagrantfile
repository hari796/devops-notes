Vagrant.configure("2") do |config|

  config.vm.provision "fix-no-tty", type: "shell" do |s|				# trying to resolve a problem
    s.privileged = false								# which may be Mac OS X
    s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"	# related or then just haven't
  end											# figured it out just yet

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "default.pp"
    puppet.module_path = "modules"
    puppet.options = "--verbose --debug"
  end

  config.vm.define "debian" do |debian|
    debian.vm.box = "puppetlabs/debian-8.2-64-puppet"
  end

  config.vm.define "ubuntu", autostart: false do |ubuntu|
    ubuntu.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"
  end

  config.vm.define "centos", autostart: false do |centos|
    centos.vm.box = "puppetlabs/centos-7.2-64-puppet"
  end
end
