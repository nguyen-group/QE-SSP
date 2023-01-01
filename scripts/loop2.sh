#!/bin/bash

# Example showing a simple for loop
# over a list of arguments used to convert
# a set of data files with comma separated columns
# to tab separated columns.

for csvfile in "$(ls .csv)"dodatfile="\$(basename
    \$csvfile .csv).dat"sed 's/,//g' \$csvfile >
    \$datfiledone
