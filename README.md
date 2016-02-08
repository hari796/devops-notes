# devops-notes

Personal Mac OS X devops notes written in an executable script like fashion.

## Install virtualbox and vagrant

Using homebrew, install virtualbox and vagrant.

```
$ brew install Caskroom/cask/virtualbox Caskroom/cask/vagrant
==> brew cask install Caskroom/cask/virtualbox
==> Downloading http://download.virtualbox.org/virtualbox/5.0.14/VirtualBox-5.0.
######################################################################## 100,0%
==> Verifying checksum for Cask virtualbox
==> Running installer for virtualbox; your password may be necessary.
==> Package installers may write to any location; options such as --appdir are i
Password:
```

## Install the virtual machines

Then using vagrant create a new virtual machine for Debian Jessie:

```
$ vagrant box add puppetlabs/debian-8.2-64-nocm
==> box: Loading metadata for box 'puppetlabs/debian-8.2-64-nocm'
    box: URL: https://atlas.hashicorp.com/puppetlabs/debian-8.2-64-nocm
This box can work with multiple providers! The providers that it
can work with are listed below. Please review the list and choose
the provider you will be working with.

1) virtualbox
2) vmware_desktop
3) vmware_fusion

Enter your choice: 1
==> box: Adding box 'puppetlabs/debian-8.2-64-nocm' (v1.0.0) for provider: virtualbox
    box: Downloading: https://atlas.hashicorp.com/puppetlabs/boxes/debian-8.2-64-nocm/versions/1.0.0/providers/virtualbox.box
==> box: Successfully added box 'puppetlabs/debian-8.2-64-nocm' (v1.0.0) for 'virtualbox'!
```

And the CentOS 7.2:

```
$ vagrant box add puppetlabs/centos-7.2-64-nocm
==> box: Loading metadata for box 'puppetlabs/centos-7.2-64-nocm'
    box: URL: https://atlas.hashicorp.com/puppetlabs/centos-7.2-64-nocm
This box can work with multiple providers! The providers that it
can work with are listed below. Please review the list and choose
the provider you will be working with.

1) virtualbox
2) vmware_desktop
3) vmware_fusion

Enter your choice: 1
==> box: Adding box 'puppetlabs/centos-7.2-64-nocm' (v1.0.0) for provider: virtualbox
    box: Downloading: https://atlas.hashicorp.com/puppetlabs/boxes/centos-7.2-64-nocm/versions/1.0.0/providers/virtualbox.box
==> box: Successfully added box 'puppetlabs/centos-7.2-64-nocm' (v1.0.0) for 'virtualbox'!
```

And Ubuntu 12.05 Precise Pangolin:

```
$ vagrant box add puppetlabs/ubuntu-12.04-64-nocm
==> box: Loading metadata for box 'puppetlabs/ubuntu-12.04-64-nocm'
    box: URL: https://atlas.hashicorp.com/puppetlabs/ubuntu-12.04-64-nocm
This box can work with multiple providers! The providers that it
can work with are listed below. Please review the list and choose
the provider you will be working with.

1) virtualbox
2) vmware_desktop
3) vmware_fusion

Enter your choice: 1
==> box: Adding box 'puppetlabs/ubuntu-12.04-64-nocm' (v1.0.2) for provider: virtualbox
    box: Downloading: https://vagrantcloud.com/puppetlabs/boxes/ubuntu-12.04-64-nocm/versions/1.0.2/providers/virtualbox.box
==> box: Successfully added box 'puppetlabs/ubuntu-12.04-64-nocm' (v1.0.2) for 'virtualbox'!
```

Now you should have these virtual machines installed:

```
$ vagrant box list
puppetlabs/centos-7.2-64-nocm   (virtualbox, 1.0.0)
puppetlabs/debian-8.2-64-nocm   (virtualbox, 1.0.0)
puppetlabs/ubuntu-12.04-64-nocm (virtualbox, 1.0.2)
```

## Using Vagrant

Start the virtual machines:

```
$ vagrant up --no-provision
Bringing machine 'debian' up with 'virtualbox' provider...
Bringing machine 'ubuntu' up with 'virtualbox' provider...
Bringing machine 'centos' up with 'virtualbox' provider...
==> debian: Importing base box 'puppetlabs/debian-8.2-64-puppet'...
==> debian: Matching MAC address for NAT networking...
==> debian: Checking if box 'puppetlabs/debian-8.2-64-puppet' is up to date...
```

Start the vm provisioning:

```
$ vagrant provision
==> debian: Running provisioner: puppet...
/opt/vagrant/embedded/gems/gems/vagrant-1.8.1/plugins/communicators/ssh/communicator.rb:271:in `initialize': No such file or directory @ rb_sysopen - /Users/solarflare/devops-notes/hiera.yaml (Errno::ENOENT)
	from /opt/vagrant/embedded/gems/gems/vagrant-1.8.1/plugins/communicators/ssh/communicator.rb:271:in `open'
```

Login with vagrant ssh:

```
$ vagrant ssh ubuntu
Welcome to Ubuntu 14.04.2 LTS (GNU/Linux 3.16.0-30-generic x86_64)

 * Documentation:  https://help.ubuntu.com/
vagrant@localhost:~$
```

Login directly with ssh:

```
$ vagrant ssh-config >~/.ssh/config
$ ssh centos
[vagrant@localhost ~]$ cat /etc/redhat-release 
CentOS Linux release 7.2.1511 (Core) 
[vagrant@localhost ~]$
```

Stop the virtual machines:

```
$ vagrant halt
==> ubuntu: Attempting graceful shutdown of VM...
==> centos: Attempting graceful shutdown of VM...
==> debian: Attempting graceful shutdown of VM...
```

Destroying a virtual machine can be useful, in case you want to import the clean working base box again for some reason:

```
$ vagrant destroy debian
    debian: Are you sure you want to destroy the 'debian' VM? [y/N] y
==> debian: Destroying VM and associated drives...
```

The debian virtual machine will then be re-imported during the next “vagrant up” session.

## The obligatory cat video

[![IMAGE Pallas cat checks out camera](http://img.youtube.com/vi/gIXw-3H48yU/0.jpg)](http://www.youtube.com/watch?v=gIXw-3H48yU)
