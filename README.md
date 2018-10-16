# ubnt-enable_ct

For the script to work you will need sshpass

* Ubuntu

apt-get install sshpass

* CentOS

yum --enablerepo = epel -y install sshpass

# Execution
chmod +x ubnt-enable_ct.sh

./ubnt-enable_ct.sh xxx.xxx.xxx

# Comments
As it was designed to help small providers the script is run in batch, ie it is only necessary to enter the first three IP houses the last house the script generates alone from ip 0 to 254 thus traversing an integer 24 at the end it displays the summary of how many Ubiquiti's it found and CT applyed.

# Operation
Script basically applying "enable_ct" command.

# IMPORTANT
I can not guarantee that after the script has enabled CT for all your UBNT devices, the update to the latest firmware version, change the ubnt user and use strong passwords as need.
