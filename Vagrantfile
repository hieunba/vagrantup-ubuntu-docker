Vagrant.configure(2) do |config|
    config.vm.provider "virtualbox" do |v|
         v.gui = false
         v.name = "manager3"
   	 v.linked_clone = true if Vagrant::VERSION =~ /^1.8/
    end
 
  config.vm.define :manager3 do |vb|
         vb.vm.box = "ubuntu/trusty64"

	vb.vm.hostname = "manager3"

         vb.vm.provision "shell", path: "bootstrap.sh" 

#         vb.vm.network "private_network", ip: "172.31.63.67"
         
    end
end

# details information about network, goes here:
# https://www.vagrantup.com/docs/networking/private_network.html
# https://www.vagrantup.com/docs/networking/forwarded_ports.html
