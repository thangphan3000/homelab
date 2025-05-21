#!/bin/bash

vagrant global-status | grep vmware_desktop | awk '{print $2}' | while read -r vm_name; do
  host_port=$(vagrant port "$vm_name" | tail -1 | awk '{print $4}')
  echo "Virtual machine name: $vm_name, ssh port: $host_port"
done
