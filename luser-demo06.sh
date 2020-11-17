#!/bin/bash

# This script enerates a random password for each user specified on the CLI

# Display what the user just typed
echo "You executed this command: ${0}"

# Display the path and filename of the script
echo "You used $(dirname ${0}) as the path to the $(basename ${0}) script."

# Display number of passed in params
NUMBER_OF_PARAMS="${#}"
echo "You suplied ${NUMBER_OF_PARAMS} params"

# Check at least 1 argument is supplied
if [[ "${NUMBER_OF_PARAMS}" -lt 1 ]]
then
 echo "Usage: ${0} USER_NAME [USER_NAME]..."
 exit 1
fi

# Generate and display a password for each parameter
for USER_NAME in "${@}"
do
 PASSWORD=$(date +%s%N | sha256sum | head -c48)
 echo "${USER_NAME}: ${PASSWORD}"
done

