#!/bin/bash
# Example of while loop in bash

counter=0

# Here -lt means less than
while [ $counter -lt 10 ]
do
  echo $counter
  counter=$(( counter + 1))
done
