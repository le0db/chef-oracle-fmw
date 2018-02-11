#
### Cookbook:: oracle
### Recipe:: fmw_infrastructure
###
### Copyright:: 2018, The Authors, All Rights Reserved.
###

execute 'download_fmw' do
	command 'cd /u01/oracle/Softwares && wget https://s3.amazonaws.com/oracle-services/Softwares/fmw_12.2.1.2.0_infrastructure.jar'
	user 'root'
end

execute 'response_file' do
	command 'cd /u01/oracle/ResponseFiles && wget https://s3.amazonaws.com/oracle-services/ResponseFiles/FMWresp.rsp'
	user 'root'
end

execute 'permissions' do
	command 'chown -R oracle:oinstall /u01/'
	user 'root'
end

execute 'install_fmw' do
	command 'java -jar /u01/oracle/Softwares/fmw_12.2.1.2.0_infrastructure.jar -silent -responseFile /u01/oracle/ResponseFiles/FMWresp.rsp -invPtrLoc /u01/oracle/oraInventory/oraInst.loc'
	user 'oracle'
end
