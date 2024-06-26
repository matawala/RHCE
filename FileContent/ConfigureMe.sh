#!/bin/bash
egrep -v "^#|^;|^$" ansible.cfg
sed -i 's/^inventory/#inventory/g' ansible.cfg
sed -i '/^#inventory/a inventory=$(pwd)' ansible.cfg
egrep "^\[|inven" ansible.cfg
