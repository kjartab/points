Vagrant.configure("2") do |config|

	name = 'boundless-trusty-2'

	config.vm.box = '1404_64'
	
	config.vm.provider "virtualbox" do |v|
	  v.memory = 2048
	  v.cpus = 4
	end

	config.vm.host_name = "#{name}.local"
  	
	config.vm.network :forwarded_port, host: 8888, guest: 80 # Apache
	config.vm.network :forwarded_port, host: 7878, guest: 8080 # Geoserver
	config.vm.network :forwarded_port, host: 1234, guest: 5432 # Postgresql

	config.vm.provision :shell do |sh|
		sh.path = "./sh/smartmather.sh"
	end
end