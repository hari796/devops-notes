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

Install lynx, apache2 and tomcat7 to Debian and ruby-2.3.1 to Ubuntu using Ansible:

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

PLAY [python2] *****************************************************************

TASK [raw] *********************************************************************
ok: [xenial64]

PLAY [rvm] *********************************************************************

TASK [setup] *******************************************************************
ok: [xenial64]

TASK [rvm_io.rvm1-ruby : include] **********************************************
[DEPRECATION WARNING]: Instead of sudo/sudo_user, use become/become_user and 
make sure become_method is 'sudo' (default). This feature will be removed in a 
future release. Deprecation warnings can be disabled by setting 
deprecation_warnings=False in ansible.cfg.
included: /private/etc/ansible/roles/rvm_io.rvm1-ruby/tasks/rvm.yml for xenial64

TASK [rvm_io.rvm1-ruby : Detect rvm binary] ************************************
ok: [xenial64]

TASK [rvm_io.rvm1-ruby : Detect rvm installer] *********************************
ok: [xenial64]

TASK [rvm_io.rvm1-ruby : Detect current rvm version] ***************************
skipping: [xenial64]

TASK [rvm_io.rvm1-ruby : Install rvm installer] ********************************
changed: [xenial64]

TASK [rvm_io.rvm1-ruby : Configure rvm installer] ******************************
changed: [xenial64]

TASK [rvm_io.rvm1-ruby : Import GPG keys] **************************************
ok: [xenial64]

TASK [rvm_io.rvm1-ruby : Install rvm] ******************************************
changed: [xenial64]

TASK [rvm_io.rvm1-ruby : Update rvm] *******************************************
skipping: [xenial64]

TASK [rvm_io.rvm1-ruby : Configure rvm] ****************************************
changed: [xenial64]

TASK [rvm_io.rvm1-ruby : include] **********************************************
included: /private/etc/ansible/roles/rvm_io.rvm1-ruby/tasks/rubies.yml for xenial64

TASK [rvm_io.rvm1-ruby : Detect if rubies are installed] ***********************
[DEPRECATION WARNING]: Using bare variables is deprecated. Update your playbooks
 so that the environment value uses the full variable syntax 
('{{rvm1_rubies}}'). This feature will be removed in a future release. 
Deprecation warnings can be disabled by setting deprecation_warnings=False in 
ansible.cfg.
ok: [xenial64] => (item=ruby-2.3.1)

TASK [rvm_io.rvm1-ruby : Install rubies] ***************************************
[DEPRECATION WARNING]: Using bare variables is deprecated. Update your playbooks
 so that the environment value uses the full variable syntax 
('{{detect_rubies.results}}'). This feature will be removed in a future release.
 Deprecation warnings can be disabled by setting deprecation_warnings=False in 
ansible.cfg.
changed: [xenial64] => (item={u'changed': False, u'stdout': u'', '_ansible_no_log': False, 'stdout_lines': [], u'warnings': [], 'item': u'ruby-2.3.1', u'cmd': [u'/usr/local/rvm/bin/rvm', u'ruby-2.3.1', u'do', u'true'], 'failed': False, u'delta': u'0:00:00.334396', u'stderr': u'Ruby ruby-2.3.1 is not installed.', u'rc': 2, 'invocation': {'module_name': u'command', u'module_args': {u'creates': None, u'executable': None, u'chdir': None, u'_raw_params': u'/usr/local/rvm/bin/rvm ruby-2.3.1 do true', u'removes': None, u'warn': True, u'_uses_shell': False}}, u'end': u'2016-05-24 13:07:43.388053', 'failed_when_result': False, u'start': u'2016-05-24 13:07:43.053657'})

TASK [rvm_io.rvm1-ruby : Detect default ruby version] **************************
ok: [xenial64]

TASK [rvm_io.rvm1-ruby : Select default ruby] **********************************
changed: [xenial64]

TASK [rvm_io.rvm1-ruby : Install bundler if not installed] *********************
[DEPRECATION WARNING]: Using bare variables is deprecated. Update your playbooks
 so that the environment value uses the full variable syntax 
('{{rvm1_rubies}}'). This feature will be removed in a future release. 
Deprecation warnings can be disabled by setting deprecation_warnings=False in 
ansible.cfg.
changed: [xenial64] => (item=ruby-2.3.1)

TASK [rvm_io.rvm1-ruby : Symlink ruby related binaries on the system path] *****
[DEPRECATION WARNING]: Using bare variables is deprecated. Update your playbooks
 so that the environment value uses the full variable syntax 
('{{rvm1_symlink_binaries}}'). This feature will be removed in a future release.
 Deprecation warnings can be disabled by setting deprecation_warnings=False in 
ansible.cfg.
changed: [xenial64] => (item=bundle)
changed: [xenial64] => (item=bundler)
changed: [xenial64] => (item=erb)
changed: [xenial64] => (item=executable-hooks-uninstaller)
changed: [xenial64] => (item=gem)
changed: [xenial64] => (item=irb)
changed: [xenial64] => (item=rake)
changed: [xenial64] => (item=rdoc)
changed: [xenial64] => (item=ri)
changed: [xenial64] => (item=ruby)
changed: [xenial64] => (item=testrb)

TASK [rvm_io.rvm1-ruby : Detect if ruby version can be deleted] ****************
skipping: [xenial64]

TASK [rvm_io.rvm1-ruby : Delete ruby version] **********************************
skipping: [xenial64]

PLAY RECAP *********************************************************************
jessie64                   : ok=9    changed=5    unreachable=0    failed=0   
xenial64                   : ok=17   changed=8    unreachable=0    failed=0
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
Bringing machine 'xenial64' up with 'virtualbox' provider...
==> jessie64: Importing base box 'debian/jessie64'...
==> jessie64: Matching MAC address for NAT networking...
==> jessie64: Checking if box 'debian/jessie64' is up to date...
==> jessie64: A newer version of the box 'debian/jessie64' is available! You currently
==> jessie64: have version '8.3.0'. The latest is version '8.4.0'. Run
==> jessie64: `vagrant box update` to update.
==> jessie64: Setting the name of the VM: devops-notes_jessie64_1464094323279_66195
==> jessie64: Clearing any previously set network interfaces...
==> jessie64: Preparing network interfaces based on configuration...
    jessie64: Adapter 1: nat
==> jessie64: Forwarding ports...
    jessie64: 22 (guest) => 2222 (host) (adapter 1)
==> jessie64: Booting VM...
==> jessie64: Waiting for machine to boot. This may take a few minutes...
    jessie64: SSH address: 127.0.0.1:2222
    jessie64: SSH username: vagrant
    jessie64: SSH auth method: private key
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
$ ssh xenial64
Welcome to Ubuntu 16.04 LTS (GNU/Linux 4.4.0-22-generic x86_64)

 * Documentation:  https://help.ubuntu.com/

  Get cloud support with Ubuntu Advantage Cloud Guest:
    http://www.ubuntu.com/business/services/cloud

0 packages can be updated.
0 updates are security updates.


ubuntu@ubuntu-xenial:~$
```

Stop the virtual machines:

```
$ vagrant halt
==> puppet: Attempting graceful shutdown of VM...
==> jessie64: Attempting graceful shutdown of VM...
```

## The obligatory cat video

[![IMAGE Pallas cat checks out camera](http://img.youtube.com/vi/gIXw-3H48yU/0.jpg)](http://www.youtube.com/watch?v=gIXw-3H48yU)
