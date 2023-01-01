#!/bin/bash
# Example of while loop reading lines from a file

linenumber=0

while read line
do
  linenumber=$((linenumber + 1))
  echo "$linenumber: $line"
  # This will prepend each line of a file with its line number.
done < test.txt
