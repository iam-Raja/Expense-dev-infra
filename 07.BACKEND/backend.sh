#!/bin/bash
component=$1
environment=$2
dnf install ansible -y
pip3.9 install botocore boto3
ansible pull -u -i localhost, https://github.com/iam-Raja/Ansible-Roles-tf.git -e component=$component -e env=$environment