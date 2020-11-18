#!/bin/bash

# This script demoes I/O redirection

# Redirect STDOUT to a file with >
FILE="/tmp/data"
head -n1 /etc/passwd > ${FILE}

# Redirect STDIN to a program with <
read LINE < ${FILE}
echo "LINE contains: ${LINE}"

# Redirect STDOUT to a file, overwriting the file with >
head -n3 /etc/passwd > ${FILE}
echo
echo "Contents of ${FILE}:"
cat ${FILE}

# Redirect STDOUT to a file, appending to the file with >>
echo "${RANDOM} ${RANDOM}" >> ${FILE}
echo "${RANDOM} ${RANDOM}" >> ${FILE}
echo
echo "Contents of ${FILE}:"
cat ${FILE}

# Data streams in Linux
# FD0 is STDIN (and can be redirected to a specific file)
# FD1 is STDOUT
# FD2 is STDERR

# Usage 
# command 0> file (redirects STDIN and overwrites file)
# command 1>> file (redirects STDOUT and appends file)
# command 2>> file (redirects STDERR and appends file)

# To redirect both STDOUT and STDERR use & like so:
# command &> file (to redirect and overwrite)
# command &>> file (to redirect and append)

# To redirect STDIN from a file into a command like so:
# command < file
# To redirect STDOUT nowhere use /dev/null like so:
# command > /dev/null
# To redirect STDOUT to STDERR do like so:
# command >&2

# Note: Pipes | accept STDOUT by default 
# and reject STDERR (which usually goes to the screen)
# To send both STDERR and STDOUT to a pipe use & like so:
# command |& anothercommand