#!/bin/sh
ansible-galaxy collection install community.general
ansible-playbook -i localhost, packages.yml -K