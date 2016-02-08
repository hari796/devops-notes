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

Then using vagrant create a new virtual machine:

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

## Using Vagrant

Start the virtual box:

```
$ vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'debian/jessie64'...
==> default: Matching MAC address for NAT networking...
==> default: Checking if box 'debian/jessie64' is up to date...
==> default: Setting the name of the VM: devops-notes_default_nnnnnnnnnnnnn_nnnnn
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
==> default: Forwarding ports...
    default: 80 (guest) => 3000 (host) (adapter 1)
    default: 22 (guest) => 2222 (host) (adapter 1)
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: vagrant
    default: SSH auth method: private key
    default: 
    default: Vagrant insecure key detected. Vagrant will automatically replace
    default: this with a newly generated keypair for better security.
    default: 
    default: Inserting generated public key within guest...
    default: Removing insecure key from the guest if it's present...
    default: Key inserted! Disconnecting and reconnecting using new SSH key...
==> default: Machine booted and ready!
==> default: Checking for guest additions in VM...
    default: No guest additions were detected on the base box for this VM! Guest
    default: additions are required for forwarded ports, shared folders, host only
    default: networking, and more. If SSH fails on this machine, please install
    default: the guest additions and repackage the box to continue.
    default: 
    default: This is not an error message; everything may continue to work properly,
    default: in which case you may ignore this message.
==> default: Installing rsync to the VM...
==> default: Rsyncing folder: /Users/nnn/devops-notes/ => /vagrant
```

Login with vagrant ssh:

```
$ vagrant ssh

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
vagrant@debian-jessie:~$
```

Login directly with ssh:

```
$ vagrant ssh-config --host jessie64 >~/.ssh/config
$ ssh jessie64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Mon Feb  8 10:25:49 2016 from 10.0.2.2
```

Stop the virtual box:

```
$ vagrant halt
==> default: Attempting graceful shutdown of VM...
```

## The obligatory cat video

[![IMAGE Pallas cat checks out camera](http://img.youtube.com/vi/gIXw-3H48yU/0.jpg)](http://www.youtube.com/watch?v=gIXw-3H48yU)
