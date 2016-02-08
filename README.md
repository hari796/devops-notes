# devops

Personal Mac OS X devops notes in an executable script fashion.

## Install virtualbox, vagrant and puppet

Using homebrew, install virtualbox, vagrant and puppet.

> $ brew install Caskroom/cask/virtualbox Caskroom/cask/puppet Caskroom/cask/vagrant
> ==> brew cask install Caskroom/cask/virtualbox
> ==> Downloading http://download.virtualbox.org/virtualbox/5.0.14/VirtualBox-5.0.
> ######################################################################## 100,0%
> ==> Verifying checksum for Cask virtualbox
> ==> Running installer for virtualbox; your password may be necessary.
> ==> Package installers may write to any location; options such as --appdir are i
> Password:

Then using vagrant create a new virtual machine:

> $ vagrant box add debian/jessie64
> ==> box: Loading metadata for box 'debian/jessie64'
>     box: URL: https://atlas.hashicorp.com/debian/jessie64
> This box can work with multiple providers! The providers that it
> can work with are listed below. Please review the list and choose
> the provider you will be working with.
> 
> 1) lxc
> 2) virtualbox
> 
> Enter your choice: 2   
> ==> box: Adding box 'debian/jessie64' (v8.3.0) for provider: virtualbox
>     box: Downloading: https://atlas.hashicorp.com/debian/boxes/jessie64/versions/8.3.0/providers/virtualbox.box
> ==> box: Successfully added box 'debian/jessie64' (v8.3.0) for 'virtualbox'!

## Using Vagrant

Start the virtual box:

> $ vagrant up
> Bringing machine 'default' up with 'virtualbox' provider...
> ==> default: Importing base box 'debian/jessie64'...
> ==> default: Matching MAC address for NAT networking...
> ==> default: Checking if box 'debian/jessie64' is up to date...

Login with vagrant ssh:

> $ vagrant ssh
> 
> The programs included with the Debian GNU/Linux system are free software;
> the exact distribution terms for each program are described in the
> individual files in /usr/share/doc/*/copyright.
> 
> Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
> permitted by applicable law.
> Last login: Mon Feb  8 09:08:32 2016 from 10.0.2.2
> vagrant@debian-jessie:~$

Stop the virtual box:

```
$ vagrant halt
==> default: Attempting graceful shutdown of VM...
```

## The obligatory cat video

[![IMAGE Pallas cat checks out camera](http://img.youtube.com/vi/gIXw-3H48yU/0.jpg)](http://www.youtube.com/watch?v=gIXw-3H48yU)

