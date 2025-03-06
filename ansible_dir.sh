#!/bin/bash

# I made this script to make my life easier

read -p "Please enter name of the project: " prj

mkdir -p $prj/{roles,group_vars}
cd $prj
touch ansible.cfg hosts
cat << EOF > ansible.cfg
[defaults]
inventory = ./hosts
vault_password_file = ~/.ansible/vault_password
nocows = 1

[diff]
always = true

[privilege_escalation]
become = true
EOF

