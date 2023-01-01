#!/bin/bash
# Example showing the use of the (( )) construction

var1=4
var2=5
var3=8

if (( var1 + var2 > var3 ))
# Note within the (( ))
# don't use $ symbols before variables.
then
    echo "$var1 + $var2 > $var3"
else
    echo "$var1 + $var2 <= $var3"
fi

# We can also use the construction
# to perform basic arithmetic
var4=$(( var1 var3 ))echo "\$var1 $var3 = $var4"
