#!/bin/bash

# This script creates a user with the specified username and a random password

# The user has to be root to proceed
TEST_UID='0'
if [[ "${UID}" -ne "${TEST_UID}" ]]
then
 echo "You are not super user" 1>&2
 exit 1
fi

# Check at least 1 argument is supplied or return documentation
NUMBER_OF_PARAMS="${#}"
if [[ "${NUMBER_OF_PARAMS}" -lt 1 ]]
then
 echo "Usage: ${0} USER_NAME [COMMENT]..." 1>&2
 exit 1
fi

USER_NAME=${1}

# Shift first parameter
shift

# Save the rest of the args as comment
COMMENT="${@}"

# Hashed epoch password 
PASSWORD=$(date +%s%N{RANDOM}{RANDOM} | sha256sum | head -c48) 

# Hashed epoch with random special chars appended
SPECIAL_CHARS=$(echo '"£$%^&*()_'| fold -w1 | shuf | head -c1)
PASSWORD="${PASSWORD}${SPECIAL_CHARS}"

# Create the user with the password.
useradd -c "${COMMENT}" -m ${USER_NAME} &>> /tmp/logs.out

# Check to see if the useradd command succeeded.
if [ "${?}" -ne 0 ]
then
 echo 'The useradd command did not execute succesfully' 1>&2
 exit 1
fi

# Set the password.
echo ${PASSWORD} | passwd --stdin ${USER_NAME} &>> /tmp/logs.out

# Check to see if the passwd command succeeded.
if [ "${?}" -ne 0 ]
then
 echo 'The passwd command did not execute succesfully' 1>&2
 exit 1
fi

# Force password change on first login.
passwd -e ${USER_NAME} &>> /tmp/logs.out

# Display the username, password, and the host where the user was created.
echo "Username:"
echo "${USER_NAME}"
echo "Password:"
echo "${PASSWORD}"
echo "Hostname:"
echo "${HOSTNAME}"
