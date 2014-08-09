class nginx {
  # Symlink
  file { '/usr/share/nginx/static':
    ensure => link,
    target => '/vagrant/static',
    force => true,
  }

  # Install the Nginx package
  package { 'nginx':
    ensure => present,
    require => Exec['apt-get update'],
  }

  # Ensure the runinng of our Nginx server
  service { 'nginx':
    ensure => running,
    require => Package['nginx'],
  }

  # Add our server blocks
  file { 'vagrant-nginx':
    path => '/etc/nginx/sites-available/example.com.conf',
    ensure => file,
    require => Package['nginx'],
    source => 'puppet:///modules/nginx/example.com.conf',
  }

  # Disable the default server block
  file { 'default-nginx-disable':
    path => '/etc/nginx/sites-enabled/default',
    ensure => absent,
    require => Package['nginx'],
  }

  # Enable our server block
  file { 'vagrant-nginx-enable':
    path => '/etc/nginx/sites-enabled/example.com.conf',
    target => '/etc/nginx/sites-available/example.com.conf',
    ensure => link,
    notify => Service['nginx'],
    require => [
      File['vagrant-nginx'],
      File['default-nginx-disable'],
    ],
  }
}
