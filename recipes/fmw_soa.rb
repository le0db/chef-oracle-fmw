#
### Cookbook:: oracle
### Recipe:: fmw_soa
###
### Copyright:: 2018, The Authors, All Rights Reserved.
###
execute 'download_soa' do
	command 'cd /u01/oracle/Softwares && wget https://s3.amazonaws.com/oracle-services/Softwares/fmw_12.2.1.2.0_soa.jar'
	user 'root'
end

execute 'download_soa_rsp' do
	command 'cd /u01/oracle/ResponseFiles && wget https://s3.amazonaws.com/oracle-services/ResponseFiles/SOAresp.rsp'
	user 'root'
end

execute 'install_soa' do
	command 'java -jar /u01/oracle/Softwares/fmw_12.2.1.2.0_soa.jar -silent -responseFile /u01/oracle/ResponseFiles/SOAresp.rsp -invPtrLoc /u01/oracle/oraInventory/oraInst.loc'
	user 'oracle'
end

