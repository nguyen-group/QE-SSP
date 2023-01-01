#!/bin/bash
# Example of command substitution .

# This can be done by
# enclosing the command in $( )
echo "It is now $(date)."
# Note: the "date" command outputs
# the current date and time.

# This can also be done by
# enclosing the command in backtics ` `
echo "The files in this directory are:" `ls`
