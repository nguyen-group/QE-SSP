#!/bin/bash
# Example using variables.

var1="Hello"
var2="World!"

echo $var1 $var2
# Note the use of the $ symbol when
# we want to use the value stored in the variable .
# Any command can use these variables
dirname="tmpdir"
mkdir $dirname
