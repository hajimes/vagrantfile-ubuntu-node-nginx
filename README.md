# Vagrantfile-Ubuntu-Node
Personal-use Vagrantfile for Ubuntu-Node.js(-Nginx) environments with VirtualBox and AWS providers

## Usage
### VirtualBox
```bash
vagrant up
```

### AWS provider
In AWS provider configurations, change
`aws.access_key_id`,
`aws.secret_access_key`,
`aws.keypair_name`,
`aws.subnet_id`,
`aws.security_groups`, and
`override.ssh.private_key_path` 
to appropriate values, and then

```bash
vagrant up
```

## License
MIT

## See Also
* http://jamesmcfadden.co.uk/using-vagrant-and-puppet-to-build-a-php-nginx-and-mysql-environment/
* http://stackoverflow.com/questions/5009324/node-js-nginx-and-now
