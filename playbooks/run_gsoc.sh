#!/bin/bash
# Handy shortcut for a command I run frequently...

ansible-playbook -i ~/Software/GSoC/jflory7-ansible/playbooks/deliverables/inventory/inventory -e ~/Software/GSoC/jflory7-ansible/playbooks/deliverables/inventory/group_vars/@wordpress -b ~/Software/GSoC/ansible/playbooks/manual/wordpress-install.yml --extra-vars="target='wordpress' wp_domain='b1.stg.derezzed.justinwflory.com:b2.stg.derezzed.justinwflory.com:b3.stg.derezzed.justinwflory.com:b4.stg.derezzed.justinwflory.com'"
