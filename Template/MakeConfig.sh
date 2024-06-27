#!/bin/bash
echo "inventory=`pwd`/hosts">ansible.cfg

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
