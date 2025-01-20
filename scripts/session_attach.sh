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
printf "When you are done with the session, use Ctrl+A, D to detach from the session.\n"
printf "Press Enter to continue."
read -r

# Attach to the session
sudo su - "$TARGET_USER" -c "screen -r $session_name"
