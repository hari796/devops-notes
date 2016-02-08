Vagrant.configure("2") do |config|
  config.vm.define "jessie64" do |jessie64|
    jessie64.vm.box = "debian/jessie64"
  end

  config.vm.define "puppet" do |puppet|
    puppet.vm.box = "puppetlabs/debian-8.2-64-puppet"
  end
end
