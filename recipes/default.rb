#
# Cookbook:: oracle
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#
#
execute 'att_os' do
	command 'yum update -y'
	user 'root'
end

bash 'swap_space' do
	code <<-EOH
		sudo dd if=/dev/zero of=/swapfile bs=1024 count=756k
		sudo mkswap /swapfile
		sudo swapon /swapfile
		echo /swapfile          swap            swap    defaults        0 0 >> /etc/fstab
		sudo chown root:root /swapfile
		sudo chmod 0600 /swapfile
		EOH
end
		
