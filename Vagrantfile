# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.box = "ubuntu/trusty64"
  #config.vm.hostname = "vagrant.example.com"

  config.vm.provision :shell, path: "vagrant-provision.sh"

  config.vm.provider "virtualbox" do |v, override|
    override.vm.network :forwarded_port, guest: 80, host: 8080
  end

  # Vagrant AWS Provider configurations
  # Before using this, run `vagrant plugin install vagrant-aws`
  config.vm.provider :aws do |aws, override|
    # Change these values
    aws.access_key_id = "YOUR_KEY"
    aws.secret_access_key = "YOUR_SECRET_KEY"
    aws.keypair_name = "YOUR_KEYPAIR_NAME"
    aws.subnet_id = "subnet-YOUR_SUBNET"
    aws.security_groups = ["sg-YOUR_SECURITY_GROUP"]

    # Specify parameters required for an EC2 instance
    aws.instance_type = "t2.micro"

    #aws.associate_public_ip = true
    aws.elastic_ip = true

    # Tags
    aws.tags = {
      'Name' => 'example.com',
    }

    # Defalut to US West (Northern California)
    aws.region = "us-west-1"
    aws.ami = "ami-a7fdfee2"

    aws.region = "ap-northeast-1"

    # Asia Pacific (Tokyo) Region
    aws.region_config "ap-northeast-1" do |region|
      region.ami = "ami-a1124fa0"
    end

    # Use a dummy box for the AWS provider
    override.vm.box = "dummy"
    override.ssh.username = "ubuntu"

    # Change this value to the path of your private key
    override.ssh.private_key_path = "PATH"
  end


  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file default.pp in the manifests_path directory.
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file  = "init.pp"
    puppet.options = "--debug --verbose"
  end
end
