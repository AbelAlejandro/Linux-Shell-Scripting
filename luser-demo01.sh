#!/bin/bash

# This script displays information to the standard output

# Display hello
echo 'hello'

# Assign value to var
WORD='script'

# Display that value using the variable
echo "$WORD"

# Single quotes don't expand vars
echo '$WORD'

# String interpolation
echo "This is a shell $WORD"

# Same as before but with alt-syntax
echo "This is a shell ${WORD}"

# Append text to var (requires braces syntax)
echo "${WORD}ing is fun!"

# Wrong way of doing the above
echo "$WORDing is fun!"

# Create a new var
ENDING='ed'

# Combining vars
echo "This is ${WORD}${ENDING}."

# Re assign ENDING
ENDING='ing'
echo "${WORD}${ENDING} is fun"



