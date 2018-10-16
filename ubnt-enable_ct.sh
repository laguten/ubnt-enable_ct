#!/bin/bash

# Init variables
IP=$1;
LOGIN=ubnt
PASSWORD=ubnt
#PASSWORD=ubnt
contador=0;

# Checks if parameter is passed
# Simular  as https://github.com/tiagoalucard/ubnt-mf-clean
#
if [ -z $1 ]; then
	echo "Enter the ip in the format xxx.xxx.xxx (192.168.X) will become a /24";
else

# Creates the /24
for i in `seq 0 25`; do

# Creates the subproceses on remote STA
  sshpass -p $PASSWORD ssh -o ConnectTimeout=1 -o StrictHostKeyChecking=no $LOGIN@$IP.$i \
  "enable_ct;" &

# If you want to speed up the process just comment from here
  PID[i]=$!;
  while [ -d /proc/${PID[i]} ]; do
    wait ${PID[i]};
    status=$?;
  if [ $status == 0 ]; then
    echo -e "$IP.$i \e[34m CT enabled\e[m";
    let contador=$contador+1;
  else
    echo -e "$IP.$i \e[31m CT not enabled\e[m";
  fi;
  done;
# So far (only the "done;" from above or below can not comment)

done;

# If you comment the lines above to speed up the process you can comment on the last echo that has become meaningless
echo -e "Compliance Test enabled for \e[34m$contador\e[m STA.";
fi;
