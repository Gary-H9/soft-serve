#!/bin/bash

# Generate the SSH key 
ssh-keygen -t rsa -N "" -f "/root/.ssh/id_rsa" -C "root@localhost"

cat /soft-serve/config.yaml 
cp /soft-serve/config.yaml /soft-serve/config.yaml.bk

# Add the initial admin key - required to allow the scripts to run as an authorised user.
echo "initial_admin_keys:" >> /soft-serve/config.yaml
echo "  - \"$(cat /root/.ssh/id_rsa.pub)\"" >> /soft-serve/config.yaml

# Add the repository mirrors... 