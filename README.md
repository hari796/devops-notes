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

Then using vagrant create a new virtual machine for Debian Jessie:

```
$ vagrant box add debian/jessie64
==> box: Loading metadata for box 'debian/jessie64'
    box: URL: https://atlas.hashicorp.com/debian/jessie64
This box can work with multiple providers! The providers that it
can work with are listed below. Please review the list and choose
the provider you will be working with.

1) lxc
2) virtualbox

Enter your choice: 2
==> box: Adding box 'debian/jessie64' (v8.3.0) for provider: virtualbox
    box: Downloading: https://atlas.hashicorp.com/debian/boxes/jessie64/versions/8.3.0/providers/virtualbox.box
==> box: Successfully added box 'debian/jessie64' (v8.3.0) for 'virtualbox'!
```

And the puppet:

```
$ vagrant box add puppetlabs/debian-8.2-64-puppet
==> box: Loading metadata for box 'puppetlabs/debian-8.2-64-puppet'
    box: URL: https://atlas.hashicorp.com/puppetlabs/debian-8.2-64-puppet
This box can work with multiple providers! The providers that it
can work with are listed below. Please review the list and choose
the provider you will be working with.

1) virtualbox
2) vmware_desktop
3) vmware_fusion

Enter your choice: 1
==> box: Adding box 'puppetlabs/debian-8.2-64-puppet' (v1.0.0) for provider: virtualbox
    box: Downloading: https://atlas.hashicorp.com/puppetlabs/boxes/debian-8.2-64-puppet/versions/1.0.0/providers/virtualbox.box
==> box: Successfully added box 'puppetlabs/debian-8.2-64-puppet' (v1.0.0) for 'virtualbox'!
```

Now you should have these virtual machines installed:

```
$ vagrant box list
debian/jessie64                 (virtualbox, 8.3.0)
puppetlabs/debian-8.2-64-puppet (virtualbox, 1.0.0)
```

## Using Vagrant

Start the virtual box:

```
$ vagrant up
Bringing machine 'jessie64' up with 'virtualbox' provider...
Bringing machine 'puppet' up with 'virtualbox' provider...
==> jessie64: Importing base box 'debian/jessie64'...
==> jessie64: Matching MAC address for NAT networking...
==> jessie64: Checking if box 'debian/jessie64' is up to date...
```

Login with vagrant ssh:

```
$ vagrant ssh jessie64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
vagrant@debian-jessie:~$
```

Login directly with ssh:

```
$ vagrant ssh-config >~/.ssh/config 
Jari-MacBook-Pro:devops-notes solarflare$ ssh puppet

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Mon Feb  8 04:04:04 2016 from 10.0.2.2
vagrant@localhost:~$
```

Stop the virtual box:

```
$ vagrant halt
==> puppet: Attempting graceful shutdown of VM...
==> jessie64: Attempting graceful shutdown of VM...
```

## The obligatory cat video

[![IMAGE Pallas cat checks out camera](http://img.youtube.com/vi/gIXw-3H48yU/0.jpg)](http://www.youtube.com/watch?v=gIXw-3H48yU)
