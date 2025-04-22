#!/bin/bash

# Prompt the user for input
echo -n "Enter a number: "
read number

# Validate if the input is a number
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
    echo "Invalid input! Please enter a valid number."
    exit 1
fi

# Ask the user for the type of multiplication table
echo "Choose an option:"
echo "1) Full table (1 to 10)"
echo "2) Custom range"
echo -n "Enter your choice (1 or 2): "
read choice

if [[ "$choice" == "1" ]]; then
    start=1
    end=10
elif [[ "$choice" == "2" ]]; then
    echo -n "Enter the starting value: "
    read start

    echo -n "Enter the ending value: "
    read end
    
    # Validate that start and end are numbers
    if ! [[ "$start" =~ ^[0-9]+$ ]] || ! [[ "$end" =~ ^[0-9]+$ ]]; then
        echo "Invalid input! Start and end must be numbers."
        exit 1
    fi
    
    # Ensure start is less than or equal to end
    if [[ $start -gt $end ]]; then
        echo "Invalid range! Start must be less than or equal to end."
        exit 1
    fi
else
    echo "Invalid choice! Please enter 1 or 2."
    exit 1
fi

# Ask user if they want ascending or descending order
echo "Do you want the table in ascending or descending order?"
echo "1) Ascending"
echo "2) Descending"
echo -n "Enter your choice (1 or 2): "
read order

# Generate and display the multiplication table using C-style for loop
echo "Multiplication Table for $number from $start to $end:"
if [[ "$order" == "1" ]]; then
    for (( i = start; i <= end; i++ ))
    do
        echo "$number x $i = $((number * i))"
    done
elif [[ "$order" == "2" ]]; then
    for (( i = end; i >= start; i-- ))
    do
        echo "$number x $i = $((number * i))"
    done
else
    echo "Invalid choice! Defaulting to ascending order."
    for (( i = start; i <= end; i++ ))
    do
        echo "$number x $i = $((number * i))"
    done
fi
