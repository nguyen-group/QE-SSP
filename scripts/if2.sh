#!/bin/bash
# Check if the directory " tmpdir " exists , and if not, create it , then check
# if the file " tmpdir / testfile " exists , and if not, create it.

dirname="tmpdir"
filename="testfile"

if [ ! -d "$dirname" ]
# The "!" is logical negation
# -d tests that a file exists and is a directory.
then
mkdir $dirname
fi

if [ ! -f "$dirname/$filename" ]
# -d tests that a file exists and is a regular file (i.e., not a directory ).
then
    touch "$dirname/$filename"
fi
