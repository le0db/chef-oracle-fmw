#
## Cookbook:: oracle
## Recipe:: fmw_setup
##
## Copyright:: 2018, The Authors, All Rights Reserved.
##


user 'oracle' do
	uid 1100
	username 'oracle'
	password 'oracle12345'
	shell '/bin/bash'
	home '/home/oracle'
	action :create
end	

group 'oinstall' do
	gid 1101
	group_name 'oinstall'
	members 'oracle'
	action :create
end

directory '/u01' do
	owner 'oracle'
	group 'oinstall'
	mode '0755'
	action :create
end

directory '/u01/oracle' do
	owner 'oracle'
        group 'oinstall'
        mode '0755'
        action :create
end

directory '/u01/oracle/oraInventory' do
	owner 'oracle'
        group 'oinstall'
        mode '0755'
        action :create
end


file '/u01/oracle/oraInventory/oraInst.loc' do
	content 'inventory_loc=/u01/oracle/oraInventory
		inst_group=oinstall'
end


directory '/u01/oracle/wls_fmw' do
	owner 'oracle'
	group 'oinstall'
	mode '0755'
	action :create
end

directory '/u01/oracle/Softwares' do
	owner 'oracle'
	group 'oinstall'
	mode '0755'
	action :create
end

directory '/u01/oracle/ResponseFiles' do
	owner 'oracle'
	group 'oinstall'
	mode '0755'
	action :create
end

execute 'download_jdk' do
	command 'cd /opt && rpm -ivh https://s3.amazonaws.com/oracle-services/jdk-8u77-linux-x64.rpm'
	user 'root'
end

bash 'env_variables' do
	code <<-EOH
		echo export MW_HOME=/u01/oracle/wls_fmw >> /etc/profile
		echo export JAVA_HOME=/usr/java/jdk1.8.0_77/ >> /etc/profile
		echo export PATH=/usr/java/jdk1.8.0_77/bin:$PATH >> /etc/profile
		source /etc/profile
		EOH
	user 'root'
end
