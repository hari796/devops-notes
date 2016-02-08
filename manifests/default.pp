# /etc/puppetlabs/code/environments/production/manifests/default.pp
debian {
  include common
  include apache
}
