#!/bin/bash

# Display the UID and username of the executing user
# Display if the user is vagrant

# Display the UID
echo "Your UID is ${UID}"

# Only display if the UID does NOT match 1000
TEST_UID='1000'
if [[ "${UID}" -ne "${TEST_UID}" ]]
then
 echo "Your UID does not match ${TEST_UID}"
 exit 1
fi

# Display the username
USER_NAME=$(id -un)

# Test if the command succeeded
if [ "${?}" -ne 0 ]
then
 echo 'The id command did not execute succesfully'
 exit 1
fi
echo "Your username is ${USER_NAME}"

# How to use a string test conditional
TEST_USER='vagrant'
if [[ "${USER_NAME}" = "${TEST_USER}" ]]
then
 echo "Your username matches ${TEST_USER}"
fi

# Test for != for the string
if [[ "${USER_NAME}" != "${TEST_USER}" ]]
then 
 echo "Your username does not match ${TEST_USER}"
 exit 1
fi

exit 0
