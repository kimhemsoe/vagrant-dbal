Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.host_name = "doctrine.local"
  config.vm.network :hostonly,"33.33.33.11"
  config.vm.customize ["modifyvm", :id, "--memory", 2048]

  config.vm.forward_port 3306, 83306
  config.vm.forward_port 5432, 85432
  config.vm.forward_port 1521, 81521

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path = "modules"
    puppet.manifest_file  = "doctrine.pp"
  end

  config.vm.provision :puppet_server do |puppet|
    puppet.puppet_server = "puppet"
    puppet.puppet_node = "doctrine.local"
  end
end
