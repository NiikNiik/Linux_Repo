#!/bin/bash

# Define an array of filesystems to check disk usage on
filesystems=("/" "/apps" "/database")

# Loop through each filesystem in the array
for i in ${filesystems[@]}; do

    # Get the disk usage percentage for the current filesystem
    # `df -h $i` shows disk info, `tail -n 1` gets the relevant line
    # `awk '{print $5}'` extracts the "Use%" column (e.g., 72%)
    # `cut -d % -f1` removes the '%' symbol to get just the number
    usage=$(df -h $i | tail -n 1 | awk '{print $5}' | cut -d % -f1)

    # Check if the usage is greater than or equal to 90%
    if [ $usage -ge 90 ]; then
        # Set an alert message
        alert="Running out of space on $i, Usage is: $usage%"

        # Print a message to indicate an alert email is being sent
        echo "Sending out a disk space alert email."

        # Send the alert message using mail with a subject
        echo $alert | mail -s "$i is $usage% full" your_email
    fi

done
