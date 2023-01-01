#!/bin/bash
# Example using if statements

echo "Please enter a yes or no: "
read user_response

# Note the spaces
# following `[` and before `]` are important.
if [ $user_response = yes ]
then
    echo "You entered yes."
elif [ $user_response = no ]
# "elif" is the same as "else if"
then
    echo "You entered no."
else
    echo "You didn 't enter yes or no."
fi
# "if" statements are always ended with "fi".
