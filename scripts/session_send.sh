#!/bin/bash

TARGET_USER="minecraft"
session_names() {
    sudo su - "$TARGET_USER" -c "screen -ls | grep -e '[0-9]\+\.' | awk '{print \$1}'" | cut -d'.' -f2
}

# Print each session name with a number prefix
i=1
for session in $(session_names); do
    echo "$i: $session"
    ((i++))
done

# Prompt the user to select a session
printf "Select a session: "
read -r session_number

# Get the session name by number
session_name=$(session_names | sed -n "${session_number}p")

# Prompt for the command to send to the session
printf "Enter the command to send to the session: "
read -r command

# Send the command to the session
sudo su - "$TARGET_USER" -c "screen -S $session_name -X stuff \"$command^M\""
