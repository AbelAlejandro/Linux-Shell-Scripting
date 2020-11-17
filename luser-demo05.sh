#!/bin/bash

# This script generates a list of random passwords

# A random number as a password
PASSWORD="${RANDOM}"
echo "${PASSWORD}"

# Three random numbers as a password
PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "${PASSWORD}"

# Epoch as password
PASSWORD=$(date +%s)
echo "${PASSWORD}"

# Epoch plus nanoseconds as password
PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

# Hashed epoch password
PASSWORD=$(date +%s%N | sha256sum | head -c32) 
echo "${PASSWORD}"

# Hashed epoch password 
PASSWORD=$(date +%s%N{RANDOM}{RANDOM} | sha256sum | head -c48) 
echo "${PASSWORD}"

# Hashed epoch with random special chars appended
SPECIAL_CHARS=$(echo '"£$%^&*()_'| fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHARS}"
