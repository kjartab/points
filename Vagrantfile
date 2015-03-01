Vagrant.configure("2") do |config|

	name = 'boundless-trusty-2'

	config.vm.box = 'trusty_daily'
	
	config.vm.provider "virtualbox" do |v|
	  v.memory = 6000
	  v.cpus = 4
	end

	config.vm.host_name = "#{name}.local"
  	
	config.vm.network :forwarded_port, host: 2357, guest: 80 # Apache
	config.vm.network :forwarded_port, host: 2346, guest: 8080 # Geoserver
	config.vm.network :forwarded_port, host: 2346, guest: 5432 # Postgresql

	#config.vm.provision :shell do |sh|
		#sh.path = "./sh/pdalsetup.sh"
	#end
end
