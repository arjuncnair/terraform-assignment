#!/bin/bash

terraform apply
terraform output public_ips | tr ',' ' ' >myHosts

ansible-playbook playbook/Setup.yaml --private-key ./myKey
ansible-playbook playbook/Docker.yaml --private-key ./myKey
ansible-playbook playbook/Nginx.yaml --private-key ./myKey
