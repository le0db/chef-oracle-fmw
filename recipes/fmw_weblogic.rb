#
### Cookbook:: oracle
### Recipe:: fmw_weblogic
###
### Copyright:: 2018, The Authors, All Rights Reserved.
###
#

execute 'download_wls' do
	command 'cd /u01/oracle/Softwares && wget https://s3.amazonaws.com/oracle-services/Softwares/fmw_12.2.1.2.0_wls.jar'
	user 'root'
end

execute 'dwn_rsp' do
	command 'cd /u01/oracle/ResponseFiles && wget https://s3.amazonaws.com/oracle-services/ResponseFiles/WLSresp.rsp'
	user 'root'
end

execute 'install_wls' do
	command 'java -jar /u01/oracle/Softwares/fmw_12.2.1.2.0_wls.jar -silent -responseFile /u01/oracle/ResponseFiles/WLSresp.rsp -invPtrLoc /u01/oracle/oraInventory/oraInst.loc'
	user 'oracle'
end
