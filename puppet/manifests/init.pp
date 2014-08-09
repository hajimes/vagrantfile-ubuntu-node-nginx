exec { 'apt-get update':
  path => '/usr/bin',
}

# Install miscellaneous packages
package { 'git':
  ensure => 'present',
  require => Exec['apt-get update'],
}

# Include user-defined modules
include nginx

# Provision Node.js modules and apps
include nodejs

package { [
    'bower',
    'forever',
    'grunt-cli',
    'jshint',
  ]:
  ensure   => present,
  provider => 'npm',
  require => Class['nodejs'],
}

exec { 'forever start /vagrant/nodejs/app.js':
  path => '/usr/local/node/node-default/bin',
  require => Package['forever'],
}

file { '/usr/local/bin/node':
  ensure => link,
  target => '/usr/local/node/node-default/bin/node',
  force => true,
  require => Class['nodejs'],
}

file { '/usr/local/bin/npm':
  ensure => link,
  target => '/usr/local/node/node-default/bin/npm',
  force => true,
  require => Class['nodejs'],
}
