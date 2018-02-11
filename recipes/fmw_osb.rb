#
#### Cookbook:: oracle
#### Recipe:: fmw_osb
####
#### Copyright:: 2018, The Authors, All Rights Reserved.
####
##
execute 'download_osb' do
	command 'cd /u01/oracle/Softwares && wget https://s3.amazonaws.com/oracle-services/Softwares/fmw_12.2.1.2.0_osb.jar'
	user 'root'
end

execute 'download_rsp' do
	command 'cd /u01/oracle/ResponseFiles && wget https://s3.amazonaws.com/oracle-services/ResponseFiles/OSBresp.rsp'
	user 'root'
end

execute 'install_osb' do
	command 'java -jar /u01/oracle/Softwares/fmw_12.2.1.2.0_osb.jar -silent -responseFile /u01/oracle/ResponseFiles/OSBresp.rsp -invPtrLoc /u01/oracle/oraInventory/oraInst.loc'
	user 'oracle'
end
