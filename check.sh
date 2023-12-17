#!/bin/bash

# Function to check if an email is a valid FQDN
function is_valid_email() {
    local email=$1
    if [[ $email =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        return 0
    else
        return 1
    fi
}

# Function to determine if a number is odd or even
function odd_or_even() {
    local num=$1
    if (( num % 2 == 0 )); then
        echo "even"
    else
        echo "odd"
    fi
}

# Process the text file
while read -r name email id; do
    if [[ -n $id && $id =~ ^[0-9]+$ ]]; then
        if is_valid_email "$email"; then
            echo "The ID of $email is $(odd_or_even $id) number."
        fi
    fi
done