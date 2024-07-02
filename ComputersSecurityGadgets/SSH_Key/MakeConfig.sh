#!/bin/bash
echo "[defaults]
inventory=`pwd`/hosts
[privilege_escalation]
become=true
become_method=sudo
become_user=root
#become_ask_pass=false
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
echo -e "[ControlNode]
redhat3 ansible_host=192.168.56.107

[ManagedNodes]
asus1   ansible_host=192.168.56.102
redhat2 ansible_host=192.168.56.106">hosts

# Print "ansible.cfg" and "hosts" file
for fls in ansible.cfg hosts
do
echo "### $fls ###"
cat $fls
echo ""
done

# remove yaml files
read -p "Remove yaml files? [y]: " rm_yaml
if [ "$rm_yaml" != "y" ]; then
	exit 0
else
	rm -rf ./*.yaml
fi
