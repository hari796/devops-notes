# devops-notes

Personal Mac OS X devops notes written in an executable script like fashion.

## Install Ansible

Install Ansible via pip:

```
$ sudo easy_install pip
Password:
Searching for pip
Best match: pip 7.1.2
Adding pip 7.1.2 to easy-install.pth file
Installing pip script to /usr/local/bin
Installing pip2.7 script to /usr/local/bin
Installing pip2 script to /usr/local/bin

Using /usr/local/lib/python2.7/site-packages
Processing dependencies for pip
Finished processing dependencies for pip
$ sudo pip install ansible
The directory '/Users/nnn/Library/Caches/pip/http' or its parent directory is not owned by the current user and the cache has been disabled. Please check the permissions and owner of that directory. If executing pip with sudo, you may want sudo's -H flag.
The directory '/Users/nnn/Library/Caches/pip' or its parent directory is not owned by the current user and caching wheels has been disabled. check the permissions and owner of that directory. If executing pip with sudo, you may want sudo's -H flag.
Collecting ansible
  Downloading ansible-2.0.1.0.tar.gz (1.5MB)
    100% |████████████████████████████████| 1.5MB 340kB/s 
Collecting paramiko (from ansible)
  Downloading paramiko-1.16.0-py2.py3-none-any.whl (169kB)
    100% |████████████████████████████████| 172kB 2.9MB/s 
Collecting jinja2 (from ansible)
  Downloading Jinja2-2.8-py2.py3-none-any.whl (263kB)
    100% |████████████████████████████████| 266kB 299kB/s 
Collecting PyYAML (from ansible)
  Downloading PyYAML-3.11.tar.gz (248kB)
    100% |████████████████████████████████| 249kB 716kB/s 
Requirement already satisfied (use --upgrade to upgrade): setuptools in /usr/local/lib/python2.7/site-packages (from ansible)
Requirement already satisfied (use --upgrade to upgrade): pycrypto>=2.6 in /usr/local/lib/python2.7/site-packages (from ansible)
Collecting ecdsa>=0.11 (from paramiko->ansible)
  Downloading ecdsa-0.13-py2.py3-none-any.whl (86kB)
    100% |████████████████████████████████| 90kB 1.8MB/s 
Collecting MarkupSafe (from jinja2->ansible)
  Downloading MarkupSafe-0.23.tar.gz
Installing collected packages: ecdsa, paramiko, MarkupSafe, jinja2, PyYAML, ansible
  Running setup.py install for MarkupSafe
  Running setup.py install for PyYAML
  Running setup.py install for ansible
Successfully installed MarkupSafe-0.23 PyYAML-3.11 ansible-2.0.1.0 ecdsa-0.13 jinja2-2.8 paramiko-1.16.0
You are using pip version 7.1.2, however version 8.0.3 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
```
## Running an Ansible playbook

Install lynx and apache2 using Ansible:

```
$ ansible-playbook -i staging site.yml

PLAY ***************************************************************************

TASK [setup] *******************************************************************
ok: [jessie64]

TASK [apt : update the apt cache if it's more than eight minutes old] **********
ok: [jessie64]

TASK [apt : upgrade all the packages to the latest] ****************************
changed: [jessie64]

TASK [lynx : make sure the latest lynx is installed] ***************************
changed: [jessie64]

TASK [apache2 : install apache2] ***********************************************
changed: [jessie64]

TASK [apache2 : be sure apache2 is running and enabled] ************************
ok: [jessie64]

TASK [tomcat7 : Define java_packages.] *****************************************
ok: [jessie64]

TASK [tomcat7 : Make sure java is installed.] **********************************
changed: [jessie64] => (item=[u'openjdk-7-jdk'])

TASK [tomcat7 : Make sure tomcat7 is installed.] *******************************
changed: [jessie64]

PLAY RECAP *********************************************************************
jessie64                   : ok=9    changed=5    unreachable=0    failed=0
```

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
$ ssh puppet

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Mon Feb  8 04:04:04 2016 from 10.0.2.2
vagrant@localhost:~$
```

Stop the virtual machines:

```
$ vagrant halt
==> puppet: Attempting graceful shutdown of VM...
==> jessie64: Attempting graceful shutdown of VM...
```

## The obligatory cat video

[![IMAGE Pallas cat checks out camera](http://img.youtube.com/vi/gIXw-3H48yU/0.jpg)](http://www.youtube.com/watch?v=gIXw-3H48yU)
