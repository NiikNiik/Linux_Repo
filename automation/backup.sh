#!/bin/bash

# Directories to back up
backup_dirs=("/etc" "/home" "/boot")

# Destination directory on the remote server
dest_dir="/backup"

# The remote server alias (must be defined in ~/.ssh/config or /etc/hosts)
dest_server="server1"

# Get the current date in format like Apr-20-25 for backup file naming
backup_date=$(date +%b-%d-%y)

# Inform the user which directories will be backed up
echo "Starting backup of: ${backup_dirs[@]}"

# Loop through each directory in the list
for i in "${backup_dirs[@]}"; do

    # Create a compressed tar archive of the directory and store it in /tmp
    sudo tar -Pczf /tmp/$(basename $i)-$backup_date.tar.gz $i

    # Check if tar command succeeded
    if [ $? -eq 0 ]; then
        echo "$i backup succeeded."
    else
        echo "$i backup failed."
    fi

    # Transfer the archive to the destination server via scp
    scp /tmp/$(basename $i)-$backup_date.tar.gz $dest_server:$dest_dir

    # Check if scp command succeeded
    if [ $? -eq 0 ]; then
        echo "$i transfer succeeded."
    else
        echo "$i transfer failed."
    fi

done

# Clean up: remove the temporary backup files from /tmp
sudo rm /tmp/*.gz

# Notify user that the backup process is complete
echo "Backup is done."
