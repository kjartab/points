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

    ppaRepos = [
    "ppa:ubuntugis/ubuntugis-unstable",
    ]
    
    pkg_cmd = ""
    
    dependencies = [
        "git",
        "build-essential",
        "cmake ",
        "apache2", 
        "php5",
        "php5-pgsql",
        "libgeos-dev ",
        "libgdal-dev ",
        "libpq-dev ",
        "python-all-dev ",
        "python-numpy ",
        "libproj-dev ",
        "libtiff4-dev ",
        "libxml2-dev ",
        "libboost-all-dev ",
        "libbz2-dev ",
        "libsqlite0-dev ",
        "libcunit1-dev ",
        "postgresql-server-dev-9.3 ",
        "postgresql-9.3-postgis-2.1 ",
        "libmsgpack-dev ",
        "libgeos++-dev ",
        "libeigen3-dev ",
        "libflann-dev ",
        "libglew-dev ",
        "libhdf5-serial-dev ",
        "libjsoncpp-dev ",
        "vtk6 ",
        "libvtk6-dev ",
        "gcc-multilib ",
        "g++-multilib ",
        "libglew-dev ",
        "autoconf"
    ];

    
    if ppaRepos.length > 0
      ppaRepos.each { |repo| pkg_cmd << "add-apt-repository -y " << repo << " ; " }
      pkg_cmd << "apt-get update; "
    end
    
    pkg_cmd << "apt-get install -q -y -V " + dependencies.join(" ") << " ; "

    config.vm.provision :shell, :inline => pkg_cmd
    
    config.vm.provision :shell, :inline => "echo Running startup scripts;"
      scripts = [
          "libgeotiff.sh",
          "nitro.sh",
          "hexer.sh",
          "points2grid.sh",
          "laszip.sh",
          "lazperf.sh",
          "pg_pc.sh",
          "pdal.sh",
      ];
      scripts.each { |script| config.vm.provision :shell, :path => "scripts/" << script }

    # Automatically cd to /vagrant on 'vagrant ssh'.
    config.vm.provision :shell, :inline => "echo \"\n\ncd /vagrant\n\" >> /home/vagrant/.bashrc"

end
