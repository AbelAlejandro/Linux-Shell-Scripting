#!/bin/bash

# This script creates an account on the system
# The user is prompted for user and password

# The user has to be root to proceed
TEST_UID='0'
if [[ "${UID}" -ne "${TEST_UID}" ]]
then
 echo "You are not super user"
 exit 1
fi

# Get the username (login).
read -p 'Enter a username: ' USER_NAME

# Get the real name (contents for the description field).
read -p 'Enter your real name: ' COMMENT

# Get the password.
read -p 'Enter the password: ' PASSWORD

# Create the user with the password.
useradd -c "${COMMENT}" -m ${USER_NAME}

# Check to see if the useradd command succeeded.
if [ "${?}" -ne 0 ]
then
 echo 'The useradd command did not execute succesfully'
 exit 1
fi

# Set the password.
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Check to see if the passwd command succeeded.
if [ "${?}" -ne 0 ]
then
 echo 'The passwd command did not execute succesfully'
 exit 1
fi

# Force password change on first login.
passwd -e ${USER_NAME}

# Display the username, password, and the host where the user was created.
echo "Username: ${USER_NAME}"
echo "Password: ${PASSWORD}"
echo "Hostname: ${HOSTNAME}"