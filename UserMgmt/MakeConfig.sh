#!/bin/bash
echo "[defaults]
inventory=`pwd`/hosts
[privilege_escalation]
[persistent_connection]
[connection]
[colors]
[selinux]
[diff]
[galaxy]
[inventory]
[netconf_connection]
[paramiko_connection]
[jinja2]
[tags]">ansible.cfg

#configure hosts
echo -e "[redhat]
redhat2 ansible_host=192.168.56.106">hosts

# Print "ansible.cfg" and "hosts" file
for fls in ansible.cfg hosts
do
echo "### $fls ###"
cat $fls
echo ""
done
