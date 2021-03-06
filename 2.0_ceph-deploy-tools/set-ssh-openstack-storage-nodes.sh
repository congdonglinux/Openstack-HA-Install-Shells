#!/bin/sh
nodes_name=(${!hypervisor_map[@]});
controllers_name=(${!controller_map[@]})
echo ${controllers_name[@]}
ssh-keygen

for ((i=0; i<${#hypervisor_map[@]}; i+=1));
  do
      name=${nodes_name[$i]};
      ip=${hypervisor_map[$name]};
      echo "-------------$name------------"
      ssh-copy-id root@$ip
  done;

for ((i=0; i<${#controller_map[@]}; i+=1));
  do
      name=${controllers_name[$i]};
      ip=${controller_map[$name]};
      echo "-------------$name------------"
      ssh-copy-id root@$ip
  done;

