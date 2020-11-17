#!/bin/bash

# Display UID and username of the user executing the script
# Display if the user is root or not

# Display UID
echo "Your UID is ${UID}"

# Display username
USER_NAME=$(id -un)
echo "Your name is ${USER_NAME}"

# Display if user is root or not
if [ "${UID}" -eq 0 ]
then
 echo 'You are root'
else
 echo 'You are not root'
fi

