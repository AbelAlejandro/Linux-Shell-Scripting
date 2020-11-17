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
# command 0> outputfile (redirects STDIN and overwrites outputfile)
# command 1>> outputfile (redirects STDOUT and appends outputfile)
# command 2>> outputfile (redirects STDERR and appends outputfile)
# To redirect both STDOUT and STDERR use & like so:
# command &> outputfile (to redirect and overwrite)
# command &>> outputfile (to redirect and append)

# Note: Pipes | accept STDOUT by default 
# and reject STDERR (which usually goes to the screen)
# To send both STDERR and STDOUT to a pipe use & like so:
# command |& anothercommand