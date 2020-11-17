#!/bin/bash

# This script creates an account on the system
# The user is prompted for user and password

# Get username
read -p 'Enter a username: ' USER_NAME
# Get real name
read -p 'Enter your real name: ' COMMENT
# Get password
read -p 'Enter the password: ' PASSWORD
# Create user
useradd -c "${COMMENT}" -m ${USER_NAME}
# Set password for the user
echo ${PASSWORD} | passwd --stdin ${USER_NAME}
# Force user to change password on first login
passwd -e ${USER_NAME}

