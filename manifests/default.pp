# /etc/puppetlabs/code/environments/production/manifests/default.pp

node 'debian' {
  include lamp
}

node 'ubuntu' {
  include lamp
}

node 'centos' {
  include lamp
}
