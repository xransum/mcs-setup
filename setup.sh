#!/bin/bash

# DO NOT RUN THIS SCRIPT

# Escalate rights
sudo su - root -s $(which bash)

# Pull from TIP and install updates
apt update
apt -y upgrade

# Install dependencies
apt install -y nano curl grep zip unzip # potentially optional
apt install -y bash screen openjdk-8-jdk-headless # REQUIRED

# Create a dedicated runas user with a home directory.
# Dedicated run-as user and environment
useradd --system --shell $(which bash) --home /home/minecraft -g minecraft minecraft
mkhomedir_helper minecraft

# Systemd Unit file for automating server startups
cp -fv ./minecraft@.service /etc/systemd/system/minecraft@.service